import 'package:approval_app/domain/entities/detail_approval.dart';
import 'package:approval_app/domain/usecases/get_detail_approval.dart';
import 'package:approval_app/domain/usecases/post_apprval.dart';
import 'package:flutter/foundation.dart';

import '../../utils/enum_state.dart';

class DetailApprovalNotfier extends ChangeNotifier {
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  RequestState _stateSave = RequestState.empty;
  RequestState get stateSave => _state;

  String _messageSave = "";
  String get messageSave => _messageSave;

  bool _status = false;
  bool get status => _status;

  late DetailApproval _detailApproval;
  DetailApproval get detailApproval => _detailApproval;

  final GetDetailApproval getDetailApproval;
  final SaveApproval saveApproval;
  DetailApprovalNotfier({required this.getDetailApproval,required this.saveApproval});

  Future<void> fetchDetailApproval(
      int companyId, String module, String token, int id) async {
    _state = RequestState.loading;
    notifyListeners();

    final result =
        await getDetailApproval.execute(companyId, module, token, id);
    result.fold((failure) {
      _state = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (result) {
      _detailApproval = result;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }

  Future<void> addApproval(int companyId, String module, String token, int id,
      String action, String remark) async {
    _stateSave = RequestState.loading;
    notifyListeners();

    final result =
        await saveApproval.execute(companyId, module, token, id,action,remark);
    result.fold((failure) {
      print(failure);
      _stateSave = RequestState.error;
      _messageSave = failure.message;
      notifyListeners();
    }, (result) {
      _status = result;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }
}
