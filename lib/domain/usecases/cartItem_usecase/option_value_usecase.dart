import '../../repositories/cart_item_repository/cart_item_repository.dart';
//entity
import '../../entities/option.dart';
import '../../entities/option_value.dart';
import '../../entities/full_option.dart';

class OptionValueUseCase {
  final CartItemRepository repository;

  OptionValueUseCase(this.repository);
  Future<List<Option>> getOptionByProductID({required int productID}) {
    return repository.getOptionByProductID(productID: productID);
  }

  Future<List<OptionValue>> getValueByOptionID({required int optionID}) {
    return repository.getOptionValues(optionID: optionID);
  }

  Future<int> getProductVariantID({required Map<int, int> selectedValues}) {
    final valueID2 = selectedValues.values.isNotEmpty
        ? selectedValues.values.elementAt(0)
        : null;

    final valueID1 = selectedValues.values.length > 1
        ? selectedValues.values.elementAt(1)
        : null;

    if (valueID1 == null) {
      throw Exception("Chưa chọn option nào");
    }
    print('valueID1: $valueID1, valueID2: $valueID2');
    return repository.getVariantIDByOptions(
      valueID1: valueID1,
      valueID2: valueID2,
    );
  }

  Future<List<FullOption>> getFullOptions({required int productID}) async {
    final options = await repository.getOptionByProductID(productID: productID);
    final List<FullOption> fullOptions = [];

    for (final option in options) {
      final values = await repository.getOptionValues(
        optionID: option.optionID!,
      );

      fullOptions.add(
        FullOption(
          optionID: option.optionID!,
          optionName: option.optionName!,
          productID: option.productID!,
          values: values,
        ),
      );
    }
    return fullOptions;
  }
}
