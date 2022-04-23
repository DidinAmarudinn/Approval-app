import 'package:approval_app/domain/entities/module.dart';
import 'package:approval_app/domain/usecases/get_module.dart';
import 'package:approval_app/utils/enum_state.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/login.dart';
import '../../domain/usecases/get_data_login.dart';

class MainNotifier extends ChangeNotifier {
  Login? _loginSession;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  Login? get loginSession => _loginSession;
  Company? selectedCompany;

  

  List<Module> _module = [];
  List<Module> get module => _module;

  final GetDataLogin getDataLogin;
  final GetModele getModele;
  MainNotifier({required this.getDataLogin, required this.getModele});

  Future<void> getSession() async {
    final result = await getDataLogin.execute();
    result.fold((l) => {}, (result) {
      _loginSession = result;
      changeCompany(result.data.client!.company![0]);
      notifyListeners();
    });
  }

  void changeCompany(Company company) {
    selectedCompany = company;
    getModule();
    notifyListeners();
  }

  Future<void> getModule() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getModele.execute(
        selectedCompany?.id ?? 0, _loginSession?.data.token ?? "");
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (result) {
      _module = result;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }
}
