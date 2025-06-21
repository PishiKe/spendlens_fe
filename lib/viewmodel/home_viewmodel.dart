import 'package:flutter/material.dart';
import 'package:splendlens_fe/core/models/models.dart';
import 'package:splendlens_fe/core/repository/repository.dart';
import 'package:splendlens_fe/core/utilities/shared_prefs_utils.dart';

class HomeViewModel with ChangeNotifier {
  final _userRepository = UserRepositoryImp();
  final _expenseRepository = ExpenseRepositoryImp();

  String? _username;
  String? get username => _username;

  String? _firstName;
  String get firstName => _firstName!;
  set firstName(String? newFirstName) {
    _firstName = newFirstName;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  UserResponse? _user;
  UserResponse? get user => _user;

  List<Expense> _expenses = [];
  List<Expense> get expenses => _expenses;

  double _expenseTotal = 0;
  double get expenseTotal => _expenseTotal;


  void handleUserReponse(UserResponse? response) {
    if (response != null) {
      _user = response;
      _username = response.username;
      notifyListeners();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future getUser(BuildContext context) async {
    final String key = await SharedPrefsUtils.readPrefStr('key');

    _isLoading = true;

    try {
      final response = await _userRepository.getUser(key);
      _user = response;
      _username = response?.username;
      getMontlyExpense(response!.id!);
      notifyListeners();
    } catch (e){
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  Future<MontlyExpenseTotal> getMontlyExpense(int userId) async {
    final response = await _expenseRepository.getMontlyTotalExpense(userId);
    _expenseTotal = response.totalExpense!;
    notifyListeners();

    return response;
  }

  Future<void> getExpenses() async {
    final String key = await SharedPrefsUtils.readPrefStr('key');
    await _expenseRepository.getExpenses(key).then((value) {
      _expenses = value;
      notifyListeners();
    });
  }

  Future<Expense> addExpense(Map<String, dynamic> body) async {
    final response = await _expenseRepository.createExpense(body);
    await getExpenses();
    await getMontlyExpense(_user!.id!);

    return response;
  }

  Future<List<Expense>> getExpensesByMonth(String month) async{
    List<Expense> response = [];
    try {
      if (_user?.id != null){
      final response = await _expenseRepository.getExpensesByMonth(_user!.id!, month);
      _expenses = response;
      notifyListeners();
      }

    return response;
    } catch (e) {
      rethrow;
    }

  }
}
