# The simplest way to print messages in your Dart application

## Usage

If you wish to be verbose, you may use long function names:

```dart
final log = Sprint('SampleModule');

log.debug('Debug message');
log.success('Success message');
log.info('Info message');
log.warning('Warning message');
log.error('Error message');
```

But if you prefer to be brief, use short function names instead:

```dart
final log = Sprint('SampleModule');

log.d('Debug message');
log.s('Success message');
log.i('Info message');
log.w('Warning message');
log.e('Error message');
```

Most of the time, however, you will simply need to use the Sprint instance name:

```dart
final log = Sprint('SampleModule');

log('Info message');
```
