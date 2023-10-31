import 'package:tint/tint.dart';

import 'package:sprint/src/level.dart';

/// The signature of a function responsible for logging a message.
typedef LogFunction = void Function(dynamic message, {Level level});

/// The signature of a function responsible for formatting text into a log
/// message.
typedef FormattingFunction = String Function(String text);

/// The signature of a function responsible for colouring a message.
typedef ColorFunction = String Function(String message);

/// Determines whether the program is running in a JavaScript environment.
const isWeb = identical(0, 0.0);

/// Defines the default log level of messages.
const defaultLogLevel = Level.success;

/// Maps logging levels to the methods that colour them.
final colorFunctionByLevel =
    Map<Level, ColorFunction>.unmodifiable(<Level, ColorFunction>{
  Level.debug: (message) => message.gray(),
  Level.success: (message) => message.green(),
  Level.info: (message) => message.cyan(),
  Level.warn: (message) => message.yellow(),
  Level.severe: (message) => message.red(),
  Level.fatal: (message) => message.red().onYellow(),
});

/// The base implementation of `Sprint`.
class _SprintBase {
  /// Name of the module this instance of `Sprint` is being used for logging
  /// messages about.
  final String module;

  final String _indentation;

  /// Specifies the minimum severity of messages to log.
  Level minimumLogLevel;

  /// If set to true, no messages will be displayed.
  bool quietMode;

  /// If set to true, timestamps will be included with the printed message.
  bool includeTimestamp;

  /// Prints a message to the web console or to the terminal.
  late final LogFunction log;

  _SprintBase(
    this.module, {
    required this.minimumLogLevel,
    required this.includeTimestamp,
    required this.quietMode,
  }) : _indentation = ' ' * (3 + module.length) {
    log = isWeb ? _printToConsole : _printToTerminal;
  }

  void _printToConsole(dynamic message, {Level level = defaultLogLevel}) {
    if (quietMode || level.level < minimumLogLevel.level) {
      return;
    }

    print(format(message));
  }

  void _printToTerminal(dynamic message, {Level level = defaultLogLevel}) {
    if (quietMode || level.level < minimumLogLevel.level) {
      return;
    }

    final colorMessage = colorFunctionByLevel[level]!;

    print(format(colorMessage(message.toString())));
  }

  /// Obtains a timestamp if [includeTimestamp] is `true`.
  String get timestamp => includeTimestamp ? '[${DateTime.now()}] ' : '';

  /// Formats a message with a timestamp and the owner of the `Sprint` instance.
  String format(dynamic message) {
    final content = message.toString().replaceAll('\n', '\n$_indentation');
    return '$timestamp<$module> $content';
  }

  /// A call on the instance itself is synonymous with an `info()` call.
  void call(dynamic message) => info(message);

  /// Prints a debug message.
  void debug(dynamic message) => log(message, level: Level.debug);

  /// Prints a success message.
  void success(dynamic message) => log(message, level: Level.success);

  /// Prints an informational message.
  void info(dynamic message) => log(message);

  /// Prints a warning message.
  void warn(dynamic message) => log(message, level: Level.warn);

  /// Prints a severe message.
  void severe(dynamic message) => log(message, level: Level.severe);

  /// Prints a fatal message.
  void fatal(dynamic message) => log(message, level: Level.fatal);
}

/// Defines aliases for the standard log functions.
mixin _Aliases on _SprintBase {
  /// Alias for `debug()`.
  void d(dynamic message) => debug(message);

  /// Alias for `success()`.
  void s(dynamic message) => success(message);

  /// Alias for `info()`.
  void i(dynamic message) => info(message);

  /// Alias for `warn()`.
  void w(dynamic message) => warn(message);

  /// Alias for `severe()`.
  void sv(dynamic message) => severe(message);

  /// Alias for `fatal()`.
  void f(dynamic message) => fatal(message);

  /// Alias for `info()`.
  void information(dynamic message) => info(message);

  /// Alias for `warn()`.
  void warning(dynamic message) => warn(message);
}

/// Printing API that allows for simple printing of messages.
class Sprint extends _SprintBase with _Aliases {
  /// Create an instance of `Sprint`, indicated as managing logs for [module].
  ///
  /// [minimumLogLevel] - The minimum log level to consider when attempting to
  /// log a message.
  ///
  /// [includeTimestamp] - Whether to include a timestamp with the message.
  ///
  /// [quietMode] - Whether the printing of messages should be stopped entirely.
  Sprint(
    super.module, {
    super.minimumLogLevel = Level.debug,
    super.includeTimestamp = false,
    super.quietMode = false,
  });
}
