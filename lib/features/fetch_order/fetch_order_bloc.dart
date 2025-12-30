import 'package:bloc/bloc.dart';

import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'dart:async';
//helper
import '../../core/helper.dart';
import '../../features/fetch_order/fetch_order_event.dart';
import '../../features/fetch_order/fetch_order_state.dart';

import '../../domain/usecases/address_usecase.dart';
import '../../domain/usecases/order_usecase.dart';
import '../../domain/usecases/voucher_usecase.dart';
import '../../domain/usecases/point_usecase.dart';
import '../../domain/usecases/cartItem_usecase/get_all_cartItem_uc.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/usecases/cartItem_usecase/delete_cartItem_usecase.dart';

class FetchOrderBloc extends Bloc<FetchOrderEvent, FetchOrderState> {
  final AddressUseCase addressUseCase;
  final OrderUseCase orderUseCase;
  final VoucherUseCase voucherUseCase;
  final PointUseCase pointUseCase;
  final GetAllCartItemUseCase cartItemUseCase;
  final DeleteCartItemUseCase deleteCartItemUseCase;

  final _uiEventsCtrl = StreamController<String>.broadcast();
  Stream<String> get uiEvents => _uiEventsCtrl.stream;

  FetchOrderBloc({
    required this.addressUseCase,
    required this.orderUseCase,
    required this.voucherUseCase,
    required this.pointUseCase,
    required this.cartItemUseCase,
    required this.deleteCartItemUseCase,
  }) : super(const FetchOrderState()) {
    on<GetDataEvent>(_onGetData);
    on<SelectAddressEvent>(_onSelectAddress);
    on<SelectVoucherEvent>(_onSelectVoucher);
    on<SelectPointEvent>(_onSelectPoint);
    on<ConfirmOrderEvent>(_onConfirmOrder);
    on<LoadAddressEvent>(_onLoadAddress);
    on<LoadVoucherEvent>(_onLoadVoucher);
  }
  @override
  Future<void> close() {
    _uiEventsCtrl.close();
    return super.close();
  }

  double _computeFinalAmount({
    required double subtotal,
    double voucherDiscount = 0.0,
    double pointsValue = 0.0,
    double shipping = 35000,
  }) {
    final raw = subtotal - voucherDiscount - pointsValue + shipping;
    return raw.clamp(0.0, double.infinity);
  }

  Future<void> _onGetData(
    GetDataEvent event,
    Emitter<FetchOrderState> emit,
  ) async {
    emit(state.copyWith(loadDataState: const CommonState.loading()));

    try {
      final addressDefault = await addressUseCase.getAddressDefault();
      final point = await pointUseCase.getLoyaltyPoints();
      final userID = await cartItemUseCase.getUserID();
      final listCartItems = await cartItemUseCase.getAllCartItems(
        userId: userID,
      );

      final selectedCartItems = listCartItems
          .where((c) => c.isSelected == 1)
          .toList();
      final total = selectedCartItems.fold<double>(
        0.0,
        (sum, item) => sum + (item.total),
      );
      final totalItems = selectedCartItems.fold<int>(
        0,
        (sum, item) => sum + (item.quantity ?? 0),
      );

      final finalAmount = _computeFinalAmount(
        subtotal: total,
        voucherDiscount: state.voucher?.discount ?? 0.0,
        pointsValue: state.usePoint == 1
            ? (point?.loyaltyPoints ?? 0).toDouble()
            : 0.0,
      );

      emit(
        state.copyWith(
          addressDefault: addressDefault,
          point: point,
          cartitems: selectedCartItems,
          total: total,
          totalItems: totalItems,
          finalAmount: finalAmount,
          loadDataState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loadDataState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onSelectAddress(
    SelectAddressEvent event,
    Emitter<FetchOrderState> emit,
  ) async {
    try {
      emit(state.copyWith(addressDefault: event.address));
    } catch (e) {
      emit(
        state.copyWith(
          loadDataState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onSelectVoucher(
    SelectVoucherEvent event,
    Emitter<FetchOrderState> emit,
  ) async {
    try {
      final newState = state.copyWith(voucher: event.voucher);
      final newFinal = _computeFinalAmount(
        subtotal: newState.total,
        voucherDiscount: newState.voucher?.discount ?? 0.0,
        pointsValue: newState.usePoint == 1
            ? (newState.point?.loyaltyPoints ?? 0).toDouble()
            : 0.0,
      );
      emit(newState.copyWith(voucher: event.voucher, finalAmount: newFinal));
    } catch (e) {
      emit(
        state.copyWith(
          loadDataState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onSelectPoint(
    SelectPointEvent event,
    Emitter<FetchOrderState> emit,
  ) async {
    try {
      final newUsePoint = state.usePoint == 0 ? 1 : 0;
      final newState = state.copyWith(usePoint: newUsePoint);
      final newFinal = _computeFinalAmount(
        subtotal: newState.total,
        voucherDiscount: newState.voucher?.discount ?? 0.0,
        pointsValue: newState.usePoint == 1
            ? (newState.point?.loyaltyPoints ?? 0).toDouble()
            : 0.0,
      );
      emit(newState.copyWith(usePoint: newUsePoint, finalAmount: newFinal));
    } catch (e) {
      print('Error in _onGetCartItems: $e');
      _uiEventsCtrl.add('Lỗi khi cập nhật trạng thái chọn');
    }
  }

  Future<void> _onConfirmOrder(
    ConfirmOrderEvent event,
    Emitter<FetchOrderState> emit,
  ) async {
    emit(state.copyWith(confirmOrderState: const CommonState.loading()));

    try {
      final pointsValue = (state.usePoint == 1)
          ? (state.point?.loyaltyPoints ?? 0).toDouble()
          : 0.0;
      final discountvalue =
          (state.voucher?.discount ?? 0).toDouble() + pointsValue;
      print('mã giảm  $discountvalue');
      final orderID = await orderUseCase.createOrder(
        addressId: state.addressDefault?.id ?? 0,
        voucherId: state.voucher?.voucherId,
        addressName: state.addressDefault?.fullAddress ?? '',
        totalAmount: state.total,
        discountAmount: discountvalue,
      );

      for (final item in state.cartitems ?? []) {
        final cartItem = item as CartItem;
        final productId = cartItem.productId ?? 0;
        final quantity = cartItem.quantity ?? 1;
        final price = cartItem.price;
        print(
          'Creating order detail for product $productId: quantity $quantity, price $price',
        );
        try {
          final detailId = await orderUseCase.createOrderDetail(
            orderId: orderID,
            productId: productId,
            productName: cartItem.productName ?? '',
            variantName: cartItem.variantName ?? '',
            imagePath: cartItem.imagePath ?? '',
            quantity: quantity,
            price: price,
          );
          final delete = await deleteCartItemUseCase.deleteCartItem(
            cartItemId: cartItem.id ?? 0,
          );

          print('Created order detail id: $detailId for product $productId');
        } catch (e) {
          print('Error creating order detail for product $productId: $e');
          _uiEventsCtrl.add('Lỗi tạo order detail cho product');
        }
      }

      emit(state.copyWith(confirmOrderState: const CommonState.success()));
      _uiEventsCtrl.add('Đặt hàng thành công');
    } catch (e) {
      emit(
        state.copyWith(
          confirmOrderState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onLoadAddress(
    LoadAddressEvent event,
    Emitter<FetchOrderState> emit,
  ) async {
    try {
      final listAddresses = await addressUseCase.getAddress();
      emit(state.copyWith(addresses: listAddresses));
    } catch (e) {
      print('Error in _onLoadAddress: $e');
      _uiEventsCtrl.add('Lỗi khi tải địa chỉ');
    }
  }

  Future<void> _onLoadVoucher(
    LoadVoucherEvent event,
    Emitter<FetchOrderState> emit,
  ) async {
    try {
      final listVouchers = await voucherUseCase.getVoucherAvailable(
        state.total,
      );
      emit(state.copyWith(vouches: listVouchers));
    } catch (e) {
      print('Error in _onLoadVoucher: $e');
      _uiEventsCtrl.add('Lỗi khi tải voucher');
    }
  }
}
