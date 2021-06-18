import 'package:sprint/sprint.dart';

void main() {
  final log = Sprint('Module');

  print('Printing messages using long function names:');

  log.debug('Debug message');
  log.success('Success message');
  log.info('Info message');
  log.warning('Warning message');
  log.error('Error message');

  print('Printing messages using short function names:');

  log.d('Debug message');
  log.s('Success message');
  log.i('Info message');
  log.w('Warning message');
  log.e('Error message');

  print('Printing messages by calling the variable itself:');

  log('Info message');
}
