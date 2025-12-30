import 'option_value.dart';

class FullOption {
  final int optionID;
  final String optionName;
  final int productID;
  final List<OptionValue> values;

  const FullOption({
    required this.optionID,
    required this.optionName,
    required this.productID,
    required this.values,
  });
}
