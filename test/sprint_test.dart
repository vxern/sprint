import 'package:sprint/sprint.dart';

void main() {
  final log = Sprint('Module');

  print('Printing messages using long function names:');
  log.debug('Debug message');
  log.success('Success message');
  log.info('Info message');
  log.warning('Warning message');
  log.severe('Severe message');
  log.fatal('Fatal message');

  print('Printing messages using short function names:');
  log.d('Debug message');
  log.s('Success message');
  log.i('Info message');
  log.w('Warning message');
  log.sv('Severe message');
  log.f('Fatal message');

  print('Printing messages by calling the variable itself:');
  log('Info message');

  log.quietMode = true;
  log('This message will not be posted, as `quietMode` is set to true.');

  log.quietMode = false;
  log('However, this one *will* be.');
}

// ignore_for_file: cascade_invocations
