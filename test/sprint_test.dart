import 'package:sprint/sprint.dart';

void main() {
  final sprint = Sprint('Module');

  print('Printing messages using long function names:');
  sprint.debug('Debug message');
  sprint.success('Success message');
  sprint.info('Info message');
  sprint.warning('Warning message');
  sprint.severe('Severe message');
  sprint.fatal('Fatal message');

  print('Printing messages using short function names:');
  sprint.d('Debug message');
  sprint.s('Success message');
  sprint.i('Info message');
  sprint.w('Warning message');
  sprint.sv('Severe message');
  sprint.f('Fatal message');

  print('Printing messages by calling the variable itself:');
  sprint('Info message');

  sprint.quietMode = true;
  sprint('This message will not be printed, as `quietMode` is set to true.');

  sprint.quietMode = false;
  sprint('However, this one *will* be.');
}

// ignore_for_file: cascade_invocations
