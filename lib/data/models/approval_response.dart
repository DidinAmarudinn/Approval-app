import 'package:approval_app/data/models/approval_model.dart';
import 'package:equatable/equatable.dart';

class ApprovalResponse extends Equatable {
  final List<ApprovalModel> approvalList;

  const ApprovalResponse({required this.approvalList});

  factory ApprovalResponse.fromJson(List<dynamic> json) => ApprovalResponse(
      approvalList: List<ApprovalModel>.from(
          (json).map((x) => ApprovalModel.fromJson(x))));

  @override
  List<Object> get props => [approvalList];
}
