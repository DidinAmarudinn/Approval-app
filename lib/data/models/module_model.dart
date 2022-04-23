import 'package:approval_app/domain/entities/module.dart';

class ModuleModel {
  ModuleModel({
    this.module,
    this.card,
    this.title,
    this.icon,
    this.bagde,
  });

  String? module;
  CardModel? card;
  String? title;
  String? icon;
  BagdeModel? bagde;

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
        module: json["module"],
        card: CardModel.fromJson(json["card"]),
        title: json["title"],
        icon: json["icon"],
        bagde: BagdeModel.fromJson(json["bagde"]),
      );

  Map<String, dynamic> toJson() => {
        "module": module,
        "card": card?.toJson(),
        "title": title,
        "icon": icon,
        "bagde": bagde?.toJson(),
      };

  Module toEntity() => Module(
      module: module,
      card: card?.toEntity(),
      title: title,
      icon: icon,
      bagde: bagde?.toEntity());
}

class BagdeModel {
  BagdeModel({
    this.waiting,
    this.today,
    this.overdue,
  });

  OverdueModel? waiting;
  OverdueModel? today;
  OverdueModel? overdue;

  factory BagdeModel.fromJson(Map<String, dynamic> json) => BagdeModel(
        waiting: OverdueModel.fromJson(json["waiting"]),
        today: OverdueModel.fromJson(json["today"]),
        overdue: OverdueModel.fromJson(json["overdue"]),
      );

  Map<String, dynamic> toJson() => {
        "waiting": waiting?.toJson(),
        "today": today?.toJson(),
        "overdue": overdue?.toJson(),
      };

  Bagde toEntity() => Bagde(
      overdue: overdue?.toEntity(),
      waiting: waiting?.toEntity(),
      today: today?.toEntity());
}

class OverdueModel {
  OverdueModel({
    this.text,
    this.color,
  });

  int? text;
  String? color;

  factory OverdueModel.fromJson(Map<String, dynamic> json) => OverdueModel(
        text: json["text"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "color": color,
      };

  Overdue toEntity() => Overdue(text: text, color: color);
}

class CardModel {
  CardModel({
    this.shadowColor,
  });

  String? shadowColor;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        shadowColor: json["shadowColor"],
      );

  Map<String, dynamic> toJson() => {
        "shadowColor": shadowColor,
      };

  Card toEntity() => Card(shadowColor: shadowColor);
}
