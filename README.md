## The simplest way to print messages in your Dart project

### Usage

If you like your code verbose, you may use long function names:

```dart
final log = Sprint('Module');

log.debug('Debug message');
log.success('Success message');
log.info('Info message');
log.warn('Warning message');
log.severe('Severe message');
log.fatal('Fatal message');
```

If you prefer to be brief in your writing, use short function names instead:

```dart
final log = Sprint('Module');

log.d('Debug message');
log.s('Success message');
log.i('Info message');
log.w('Warning message');
log.sv('Severe message');
log.f('Fatal message');
```

It is also possible to call the instance itself as follows:

```dart
final log = Sprint('Module');

log('Info message');
```

To include timestamps in logs, set `includeTimestamp` to `true`:

```dart
final log = Sprint('Module', includeTimestamp: true);

log('This message will not be posted.');
```

The display of messages can be controlled using the `quietMode` field. If set to
`true`, no messages will be printed.

```dart
log.quietMode = true;
log('This message will not be posted.');

log.quietMode = false;
log('However, this one *will* be.');
```
