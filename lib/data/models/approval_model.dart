import 'package:approval_app/data/models/module_model.dart';
import 'package:approval_app/domain/entities/approval.dart';

class ApprovalModel {
  ApprovalModel({
    this.id,
    this.card,
    this.title,
    this.date,
    this.bagde,
    this.footer,
  });

  int? id;
  CardModel? card;
  String? title;
  String? date;
  BagdeApprovalModel? bagde;
  String? footer;

  factory ApprovalModel.fromJson(Map<String, dynamic> json) => ApprovalModel(
        id: json["id"],
        card: CardModel.fromJson(json["card"]),
        title: json["title"],
        date: json["date"],
        bagde: BagdeApprovalModel.fromJson(json["bagde"]),
        footer: json["footer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "card": card?.toJson(),
        "title": title,
        "date": date,
        "bagde": bagde?.toJson(),
        "footer": footer,
      };

  Approval toEntity() => Approval(
        id: id,
        card: card?.toEntity(),
        title: title,
        date: date,
        bagde: bagde?.toEntity(),
        footer: footer,
      );
}

class BagdeApprovalModel {
  BagdeApprovalModel({
    this.text,
    this.color,
  });

  String? text;
  String? color;

  factory BagdeApprovalModel.fromJson(Map<String, dynamic> json) =>
      BagdeApprovalModel(
        text: json["text"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "color": color,
      };

  BagdeApproval toEntity() => BagdeApproval(text: text, color: color);
}
