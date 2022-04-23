import 'package:approval_app/domain/entities/login.dart';
import 'package:approval_app/domain/usecases/do_login.dart';
import 'package:approval_app/domain/usecases/get_data_login.dart';
import 'package:approval_app/utils/enum_state.dart';
import 'package:flutter/foundation.dart';

class LoginNotifier extends ChangeNotifier {
  RequestState _state = RequestState.empty;

  RequestState get state => _state;
  
  int? idCompany;
  

  String _message = "";
  String get message => _message;

  late Login _result;
  Login get result => _result;

  final DoLogin doLogin;

  LoginNotifier({required this.doLogin});

  Future<void> login(String loginId, String password, String client) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await doLogin.execute(loginId, client, password);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (result) {
      _result = result;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

 

}
