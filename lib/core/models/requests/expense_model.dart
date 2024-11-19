// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class Expense with _$Expense {
    const factory Expense({
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "amount")
        int? amount,
    }) = _Expense;

    factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);
}
