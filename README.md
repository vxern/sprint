<<<<<<< HEAD
## The simplest way to print messages in your Dart project
=======
# The simplest way to print messages in your Dart application
>>>>>>> 05b8f0ec901e80a8a0d762523ea93437d248d919

### Usage

<<<<<<< HEAD
If you like your code verbose, you may use long function names:
=======
If you wish to be verbose, you may use long function names:
>>>>>>> 05b8f0ec901e80a8a0d762523ea93437d248d919

```dart
final log = Sprint('Sample', productionMode: false);

log.debug('Debug message');
log.success('Success message');
log.info('Info message');
log.warn('Warning message');
log.severe('Severe message');
log.fatal('Fatal message');
```

If you prefer to be brief in your writing, use short function names instead:

```dart
final log = Sprint('Sample', productionMode: false);

log.d('Debug message');
log.s('Success message');
log.i('Info message');
log.w('Warning message');
log.sv('Severe message');
log.f('Fatal message');
```

Most of the time, however, you will simply need to use the Sprint instance name:

```dart
log('Info message');
```

The display of messages can be controlled using the `quietMode` field. If set to `true`, no messages will be printed.

```dart
log.quietMode = true;
log('This message will not be posted.');

log.quietMode = false;
log('However, this one *will* be.');
```