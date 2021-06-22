import 'package:ansicolor/ansicolor.dart';

/// Determines how a message is printed and logged
enum Severity { debug, success, info, warning, error }

/// Logger class that allows simple logging of messages, including the origin of the message.
class Sprint {
  /// Umbrella name for the calling code
  final String owner;

  /// Controls the printing of messages
  bool quietMode;

  /// Whether this Sprint instance should print the time
  final bool printTime;

  /// Construct logger with a name of its owner
  Sprint(this.owner, {this.printTime = false, this.quietMode = false});

  /// Assigns a colour to the severity of the message and outputs a coloured message once formatted
  void log(dynamic message, {Severity severity = Severity.info}) {
    if (quietMode) return;

    final AnsiPen pen;

    switch (severity) {
      case Severity.debug:
        pen = AnsiPen()..gray();
        break;
      case Severity.success:
        pen = AnsiPen()..green();
        break;
      case Severity.info:
        pen = AnsiPen()..cyan();
        break;
      case Severity.warning:
        pen = AnsiPen()..yellow();
        break;
      case Severity.error:
        pen = AnsiPen()..red();
        break;
    }

    // Ensure new messages have correct indentation, based on the owner name
    message =
        message.toString().replaceAll('\n', '\n' + ' ' * (3 + owner.length));
    message = pen(message.toString());

    print(
        '[$owner] ${printTime ? DateTime.now().toString() + ' ' : ''}$message');
  }

  /// Prints a debug message
  void debug(dynamic message) => log(message, severity: Severity.debug);
  void d(dynamic message) => debug(message);

  /// Prints a success message
  void success(dynamic message) => log(message, severity: Severity.success);
  void s(dynamic message) => success(message);

  /// Prints an informational message
  void info(dynamic message) => log(message, severity: Severity.info);
  void i(dynamic message) => info(message);

  /// Prints a warning message
  void warning(dynamic message) => log(message, severity: Severity.warning);
  void w(dynamic message) => warning(message);

  /// Prints an error message
  void error(dynamic message) => log(message, severity: Severity.error);
  void e(dynamic message) => error(message);

  /// Treat a Sprint instance such that `Sprint('Message')` is the same as `Sprint.info('')`
  void call(dynamic message) => log(message, severity: Severity.info);
}
