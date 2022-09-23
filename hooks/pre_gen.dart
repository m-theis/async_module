import 'dart:io';

import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

Future run(HookContext context) async {
  final logger = context.logger;

  final bool wrapWithPage = context.vars['wrap_with_page'];

  final directory = Directory.current.path;
  List<String> folders;
  try {
    //TODO improve errors and lib folder detection
    if (Platform.isWindows) {
      folders = directory.split(r'\').toList();
    } else {
      folders = directory.split('/').toList();
    }
    // Find the closest lib folder in the current path
    final libIndex = folders.lastIndexOf('lib');
    // Make sure that there is a yaml this lib folder
    final modulePath = folders.sublist(libIndex + 1, folders.length).join('/');
    final pubSpecFile =
        File('${folders.sublist(0, libIndex).join('/')}/pubspec.yaml');

    final pubSpecContent = await pubSpecFile.readAsString();
    final loadedYaml = loadYaml(pubSpecContent);
    final packageName = loadedYaml['name'];
    final moduleName = context.vars['module_name'].toString().toLowerCase();

    if (packageName == null) {
      throw PubspecNotFound();
    }

    context.vars = {
      ...context.vars,
      'fullPath':
          ('$packageName/$modulePath/$moduleName').replaceAll('//', '/'),
      'wrapWithPage': wrapWithPage,
      'modulePath': modulePath,
      'moduleName': moduleName,
    };
  } on RangeError catch (_) {
    logger.alert(
      red.wrap(
        'Could not find the lib folder in the current directory',
      ),
    );
    throw Exception();
  } on FileSystemException catch (_) {
    logger.info(_.toString());
    logger.alert(
      red.wrap(
        'Could not find the pubspec.yaml',
      ),
    );
    throw Exception();
  } on PubspecNotFound catch (_) {
    logger.alert(
      red.wrap(
        'Could not read package name in pubspec.yaml}',
      ),
    );
    throw Exception();
  } on Exception catch (e) {
    throw e;
  }
}

class PubspecNotFound implements Exception {}
