import 'package:freezed_annotation/freezed_annotation.dart';
//entity
import '../../domain/entities/customers.dart' as entity;

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const CustomerModel._();

  const factory CustomerModel({
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'LoyaltyPoints') int? loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') String? membershipLevel,
    @JsonKey(name: 'CreatedAt') String? createdAt,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'avatarImage') String? avatarImage,
    @JsonKey(name: 'Role') String? role,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  /// chuyển từ Model sang Entity

  entity.Customer toEntity() {
    return entity.Customer(
      id: customerId,
      fullName: fullName,
      loyaltyPoints: loyaltyPoints,
      membershipLevel: membershipLevel,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      email: email,
      phone: phone,
      avatarImage: avatarImage,
      role: role,
    );
  }

  /// computed total (keeps in sync with quantity and price)
}
