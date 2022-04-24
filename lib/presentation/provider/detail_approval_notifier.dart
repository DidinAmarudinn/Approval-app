import 'package:approval_app/domain/entities/detail_approval.dart';
import 'package:approval_app/domain/usecases/get_detail_approval.dart';
import 'package:flutter/foundation.dart';

import '../../utils/enum_state.dart';

class DetailApprovalNotfier extends ChangeNotifier{
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = "";
  String get message => _message;

  late DetailApproval _detailApproval; 
  DetailApproval get detailApproval => _detailApproval;

  final GetDetailApproval getDetailApproval;
  DetailApprovalNotfier({required this.getDetailApproval});


  Future<void> fetchDetailApproval(int companyId, String module, String token, int id)async{
    _state = RequestState.loading;
    notifyListeners();

    final result = await getDetailApproval.execute(companyId, module, token, id);
    result.fold((failure){
      _state = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (result){
      _detailApproval = result;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }
}