//  @JsonKey(name: 'CustomerID') int? customerId,
//   @JsonKey(name: 'FullName') String? name,
//   @JsonKey(name: 'LoyaltyPoints') int? loyaltyPoints,
//   @JsonKey(name: 'MembershipLevel') String? membershipLevel,
//   @JsonKey(name: 'CreatedAt') String? createdAt,
//   @JsonKey(name: 'Email') String? email,
//   @JsonKey(name: 'Phone') String? phone,
//   @JsonKey(name: 'avatarImage') String? avatarImage,
//   @JsonKey(name: 'Role') String? role,

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customers.freezed.dart';

@freezed
class Customer with _$Customer {
  const Customer._(); // private ctor for custom getters

  const factory Customer({
    int? id,
    String? fullName,
    int? loyaltyPoints,
    String? membershipLevel,
    DateTime? createdAt,
    String? email,
    String? phone,
    String? avatarImage,
    String? role,
  }) = _Customer;
}
