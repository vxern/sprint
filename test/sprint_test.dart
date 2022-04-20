import 'package:sprint/sprint.dart';

void main() {
  final sprint = Sprint('Module');

  print('Printing messages using long function names:');
  sprint
    ..debug('Debug message')
    ..success('Success message')
    ..info('Info message')
    ..warning('Warning message')
    ..severe('Severe message')
    ..fatal('Fatal message');

  print('Printing messages using short function names:');
  sprint
    ..d('Debug message')
    ..s('Success message')
    ..i('Info message')
    ..w('Warning message')
    ..sv('Severe message')
    ..f('Fatal message');

  print('Printing messages by calling the variable itself:');
  sprint('Info message');

  sprint.quietMode = true;
  sprint('This message will not be printed, as `quietMode` is set to true.');

  sprint.quietMode = false;
  sprint('However, this one *will* be.');
}
