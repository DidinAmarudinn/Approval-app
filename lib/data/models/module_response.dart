import 'package:approval_app/data/models/module_model.dart';
import 'package:equatable/equatable.dart';

class ModuleResponse extends Equatable {
  final List<ModuleModel> moduleList;

  const ModuleResponse({required this.moduleList});

  factory ModuleResponse.fromJson(List<dynamic> json) => ModuleResponse(
      moduleList: List<ModuleModel>.from(
          (json).map((x) => ModuleModel.fromJson(x))));

  @override
  List<Object> get props => [moduleList];
}
