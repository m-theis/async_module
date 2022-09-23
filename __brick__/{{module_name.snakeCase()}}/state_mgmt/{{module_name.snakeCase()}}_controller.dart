import 'dart:math';
import 'package:riverpod/riverpod.dart';

import '{{module_name.snakeCase()}}_state.dart';



final {{module_name.camelCase()}}Provider =
    StateNotifierProvider.autoDispose<{{module_name.pascalCase()}}Controller, {{module_name.pascalCase()}}State>(
  (ref) => {{module_name.pascalCase()}}Controller()..init(),
);


class {{module_name.pascalCase()}}Controller
    extends StateNotifier<{{module_name.pascalCase()}}State> {
  {{module_name.pascalCase()}}Controller()
      : super(const {{module_name.pascalCase()}}State.loading());

  Future<void> init() async {
    await getNumberOrNot();
  }

  Future<void> getNumberOrNot() async {
  state = const {{module_name.pascalCase()}}State.loading();
  await Future.delayed(const Duration(seconds: 2));
  // Ramdom Number Generator -> Chances are 60/60
  final number = Random().nextInt(10);
  if(number < 5) {
    //State is...
    state = {{module_name.pascalCase()}}State.loaded(number: number);
  } else {
    state =  {{module_name.pascalCase()}}State.error(exception: Exception('You failed'));
  }
  }

}
