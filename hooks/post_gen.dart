import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Generating freezed files');

  try {
    final modulePath = context.vars['modulePath'].toString();
    final moduleName = context.vars['moduleName'].toString();
    var buildRunnerPath;
    if (modulePath.isNotEmpty) {
      buildRunnerPath = 'lib/$modulePath/$moduleName/**/*.dart';
    } else {
      buildRunnerPath = 'lib/$moduleName/**/*.dart';
    }
    await _generateFreezedFiles(buildRunnerPath);
    progress.complete('Generated freezed files in $buildRunnerPath');
  } on GenerateFreezedFileException catch (e) {
    progress.fail('Generating freezed files failed ${e.toString()}');
  } catch (e) {
    progress.fail('Generation failed ${e.toString()}');
  }
}

Future<void> _generateFreezedFiles(String buildRunnerPath) {
  try {
    return Process.run(
      'flutter',
      [
        'pub',
        'run',
        'build_runner',
        'build',
        '--build-filter',
        buildRunnerPath,
      ],
    );
  } catch (e, s) {
    throw GenerateFreezedFileException(e, s);
  }
}

abstract class GenerateException implements Exception {
  const GenerateException(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;
}

class GenerateFreezedFileException extends GenerateException {
  const GenerateFreezedFileException(super.error, super.stackTrace);
}
