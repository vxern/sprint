import 'package:tint/tint.dart';

import 'package:sprint/src/level.dart';

/// Defines the signature of a function responsible for logging to the terminal
/// or console.
typedef LogFunction = void Function(dynamic message, {Level level});

/// Defines the signature of a function responsible for colouring a string.
typedef ColorFunction = String Function(String string);

/// Determines whether the program is running in a JavaScript environment.
const isWeb = identical(0, 0.0);

/// Maps logging levels to the methods that colour them.
final colorMappings = <Level, ColorFunction>{
  Level.debug: (string) => string.gray(),
  Level.success: (string) => string.green(),
  Level.info: (string) => string.cyan(),
  Level.warn: (string) => string.yellow(),
  Level.severe: (string) => string.red(),
  Level.fatal: (string) => string.red().onYellow(),
};

/// Printing API that allows for simple printing of messages.
class Sprint {
  /// Name of the module this instance of `Sprint` is being used for logging
  /// messages about.
  final String module;

  /// When set to true, debug messages will not be displayed.
  @Deprecated('Specify a minimum log level instead')
  final bool productionMode;

  /// Specifies the minimum severity of messages to log.
  Level minimumLogLevel;

  /// If set to true, no messages will be displayed.
  bool quietMode;

  /// If set to true, timestamps will be included with the printed message.
  bool includeTimestamp;

  /// Prints a message to the web console or to the terminal.
  late final LogFunction log;

  /// Create an instance of `Sprint`, indicated as belonging to [module].
  ///
  /// [productionMode] - Whether the project using `Sprint` is in production
  /// mode, thus stopping the printing of `Severity.debug` messages.
  ///
  /// [includeTimestamp] - Whether to include a timestamp with the message.
  ///
  /// [quietMode] - Whether the printing of messages should be stopped entirely.
  Sprint(
    this.module, {
    @Deprecated('Specify a minimum log level instead')
        this.productionMode = false,
    this.minimumLogLevel = Level.debug,
    this.includeTimestamp = false,
    this.quietMode = false,
  }) {
    log = isWeb ? _printToConsole : _printToTerminal;
  }

  /// Obtains a timestamp if [includeTimestamp] is `true`.
  String get timestamp => includeTimestamp ? '[${DateTime.now()}] ' : '';

  /// Formats a message with a timestamp and the owner of the `Sprint` instance.
  String format(dynamic message) {
    final content =
        message.toString().replaceAll('\n', '\n${' ' * (3 + module.length)}');
    return '$timestamp<$module> $content';
  }

  void _printToConsole(dynamic message, {Level level = Level.info}) {
    if (quietMode || level.index < minimumLogLevel.index) {
      return;
    }

    print(format(message));
  }

  void _printToTerminal(dynamic message, {Level level = Level.info}) {
    if (quietMode || level.index < minimumLogLevel.index) {
      return;
    }

    print(format(colorMappings[level]!(message.toString())));
  }

  /// Prints a debug message.
  void debug(dynamic message) => log(message, level: Level.debug);

  /// Alias for `debug()`.
  void d(dynamic message) => debug(message);

  /// Prints a success message.
  void success(dynamic message) => log(message, level: Level.success);

  /// Alias for `success()`.
  void s(dynamic message) => success(message);

  /// Prints an informational message.
  void info(dynamic message) => log(message);

  /// Alias for `info()`.
  void information(dynamic message) => info(message);

  /// Alias for `info()`.
  void i(dynamic message) => info(message);

  /// Prints a warning message.
  void warn(dynamic message) => log(message, level: Level.warn);

  /// Alias for `warn()`.
  void warning(dynamic message) => warn(message);

  /// Alias for `warn()`.
  void w(dynamic message) => warn(message);

  /// Prints a severe message.
  void severe(dynamic message) => log(message, level: Level.severe);

  /// Alias for `severe()`.
  void sv(dynamic message) => severe(message);

  /// Prints a fatal message.
  void fatal(dynamic message) => log(message, level: Level.fatal);

  /// Alias for `fatal()`.
  void f(dynamic message) => fatal(message);

  /// A call on the instance itself is synonymous with an `info()` call.
  void call(dynamic message) => info(message);
}
