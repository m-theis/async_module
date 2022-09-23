import 'package:flutter/material.dart';
import 'package:{{{fullPath}}}/state_mgmt/state_mgmt.dart';


/// I don't know how to write comments
///
/// And at this point I am too afraid to ask
class {{module_name.pascalCase()}} extends ConsumerWidget {
  const {{module_name.pascalCase()}}({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final state = ref.watch({{module_name.camelCase()}}Provider);
  // final controller = ref.read({{module_name.camelCase()}}Provider.notifier);  

  return state.when(
    loading: () => const CircularProgressIndicator(),
    error: (err) => Text('Error: $err'),
    loaded: (number) {
      return Text(number.toString());
    },
  );
}
}
