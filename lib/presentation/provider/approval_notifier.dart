import 'package:approval_app/domain/entities/approval.dart';
import 'package:approval_app/domain/usecases/get_list_approval.dart';
import 'package:flutter/foundation.dart';

import '../../utils/enum_state.dart';

class ApprovalNotfier extends ChangeNotifier {
  RequestState _state = RequestState.empty;

  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  List<Approval> _approval = [];
  List<Approval> get approval => _approval;

  final GetListApproval getListApproval;
  ApprovalNotfier({required this.getListApproval});

  Future<void> getApproval(int companyId, String module, String token) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getListApproval.execute(companyId, module, token);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (result) {
      _approval = result;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }
}
