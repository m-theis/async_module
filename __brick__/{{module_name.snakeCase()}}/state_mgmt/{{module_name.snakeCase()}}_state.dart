import 'package:freezed_annotation/freezed_annotation.dart';

part '{{module_name.snakeCase()}}_state.freezed.dart';

@freezed
class {{module_name.pascalCase()}}State with _${{module_name.pascalCase()}}State {
  const factory {{module_name.pascalCase()}}State.loaded({
    required int number,
  }) = {{module_name.pascalCase()}}Loaded;

  const factory {{module_name.pascalCase()}}State.loading() = 
  {{module_name.pascalCase()}}Loading;

  const factory {{module_name.pascalCase()}}State.error({
    required Exception exception,
  }) = {{module_name.pascalCase()}}Error;

}