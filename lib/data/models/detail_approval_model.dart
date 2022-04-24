import 'package:approval_app/domain/entities/detail_approval.dart';

class DetailApprovalModel {
  DetailApprovalModel({
    this.id,
    this.title,
    this.html,
    this.approval,
    this.recall,
  });

  int? id;
  String? title;
  String? html;
  ApprovalDataModel? approval;
  RecallModel? recall;

  factory DetailApprovalModel.fromJson(Map<String, dynamic> json) {
    if (json["approval"] != null) {
      return DetailApprovalModel(
        id: json["id"],
        title: json["title"],
        html: json["html"],
        approval: json["approval"] == null
            ? null
            : ApprovalDataModel.fromJson(json["approval"]),
        recall:null,
      );
    } else if (json["recall"] != null){
      return DetailApprovalModel(
        id: json["id"],
        title: json["title"],
        html: json["html"],
        approval: null,
        recall: RecallModel.fromJson(json["recall"]),
      );
    }else{
       return DetailApprovalModel(
        id: json["id"],
        title: json["title"],
        html: json["html"],
        approval: null,
        recall: null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "html": html,
        "approval": approval?.toJson(),
        "recall": recall?.toJson(),
      };
  DetailApproval toEntity() => DetailApproval(
        id: id,
        title: title,
        html: html,
        approval: approval?.toEntity(),
        recall: recall?.toEntity(),
      );
}

class ApprovalDataModel {
  ApprovalDataModel({
    this.text,
    this.color,
    this.dialog,
  });

  String? text;
  String? color;
  ApprovalDialogModel? dialog;

  factory ApprovalDataModel.fromJson(Map<String, dynamic> json) =>
      ApprovalDataModel(
        text: json["text"],
        color: json["color"],
        dialog: ApprovalDialogModel.fromJson(json["dialog"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "color": color,
        "dialog": dialog?.toJson(),
      };
  ApprovalData toEntity() =>
      ApprovalData(text: text, color: color, dialog: dialog?.toEntity());
}

class ApprovalDialogModel {
  ApprovalDialogModel({
    this.approve,
    this.reject,
  });

  ApproveClassModel? approve;
  ApproveClassModel? reject;

  factory ApprovalDialogModel.fromJson(Map<String, dynamic> json) =>
      ApprovalDialogModel(
        approve: ApproveClassModel.fromJson(json["approve"]),
        reject: ApproveClassModel.fromJson(json["reject"]),
      );

  Map<String, dynamic> toJson() => {
        "approve": approve?.toJson(),
        "reject": reject?.toJson(),
      };
  ApprovalDialog toEntity() =>
      ApprovalDialog(approve: approve?.toEntity(), reject: reject?.toEntity());
}

class ApproveClassModel {
  ApproveClassModel({
    this.text,
    this.color,
  });

  String? text;
  String? color;

  factory ApproveClassModel.fromJson(Map<String, dynamic> json) =>
      ApproveClassModel(
        text: json["text"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "color": color,
      };

  ApproveClass toEntity() => ApproveClass(text: text, color: color);
}

class RecallModel {
  RecallModel({
    this.text,
    this.dialog,
  });

  String? text;
  ApproveClassModel? dialog;

  factory RecallModel.fromJson(Map<String, dynamic> json) => RecallModel(
        text: json["text"],
        dialog: ApproveClassModel.fromJson(json["dialog"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "dialog": dialog?.toJson(),
      };

  Recall toEntity() => Recall(text: text, dialog: dialog?.toEntity());
}
