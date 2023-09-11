// ignore_for_file: avoid_print

import 'dart:io';
import 'package:args/args.dart';
part 'src/asset.dart';
part 'src/model.dart';

Future<void> main(List<String> arguments) async {
  ArgParser scanner = ArgParser()
    ..addOption('input', abbr: 'i', defaultsTo: 'assets', help: 'Input directory of where assets took place.')
    ..addOption('output', abbr: 'o', defaultsTo: 'lib/src/assets.dart', help: 'Output file of generated asset class')
    ..addFlag('help', abbr: 'h', negatable: false, defaultsTo: false, help: 'Print this usage information');
  ArgParser translator = ArgParser()
    ..addOption('input', abbr: 'i')
    ..addOption('output', abbr: 'o')
    ..addFlag('help', abbr: 'h', negatable: false, defaultsTo: false, help: 'Print this usage information');
  ArgParser generator = ArgParser()
    ..addOption('input',
        abbr: 'i', defaultsTo: 'lib/src/models', help: 'Input directory of where the models took place.')
    ..addFlag('help', abbr: 'h', negatable: false, defaultsTo: false, help: 'Print this usage information');
  ArgParser runner = ArgParser()
    ..addCommand('asset', scanner)
    ..addCommand('model', generator)
    ..addCommand('localize', translator)
    ..addFlag('help', abbr: 'h', negatable: false, defaultsTo: false, help: 'Print this usage information');
  try {
    ArgResults? argument = runner.parse(arguments).command;
    if (argument?.name == 'asset') {
      insertAsset(from: argument!);
    } else if (argument?.name == 'model') {
      insertModel(from: argument!);
    } else if (argument?.name == 'localize') {
      print("\x1B[31mThe feature has not yet been developed 🚧.\x1B[0m");
    } else {
      throw '\x1B[0mAvailable commands :';
    }
  } catch (e) {
    print('\n\x1B[31m$e\x1B[0m\n\n'
        '+---------------+-----------------------------------------------+\n'
        '| OPTION\t| DESCRIPTION\t\t\t\t\t|\n'
        '+---------------+-----------------------------------------------+\n'
        '| asset\t\t| Generate asset class from asset directory.\t|\n'
        '| model\t\t| Update model to extends DModel completely.\t|\n'
        '| localize\t| Generate localization class from json.\t|\n'
        '| -h, --help\t| Print this usage information.\t\t\t|\n'
        '+---------------+-----------------------------------------------+\n'
        '\nUsage : '
        '\n- dart run dart_fusion \x1B[33masset\x1B[0m'
        '\n- dart run dart_fusion \x1B[33mmodel\x1B[0m'
        '\n- dart run dart_fusion \x1B[33mlocalize\x1B[0m');
  }
}
