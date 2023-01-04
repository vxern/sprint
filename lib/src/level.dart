/// Determines the importance of a particular log message.
// The `level` is explicitly specified so as to not rely on something as
// dynamic as the index of an enum value, as well as to be able to specify
// log levels with the same `level`.
enum Level {
  /// Describes a message only for the developer to see.
  debug(0),

  /// Describes a message indicative of a good reason for celebration.
  success(1),

  /// Describes a message indicative of normal flow of execution inside the
  /// code.
  info(2),

  /// Describes a message indicative of an occurrence that is neither serious
  /// enough to disturb execution flow nor does it come without any
  /// repercussions at all.
  warn(3),

  /// Describes a message indicative of an occurrence causing a particular
  /// component to fail, but not fatal, meaning execution can continue.
  severe(4),

  /// Describes a message indicative of an occurrence causing a particular
  /// component or the whole program to not be able to continue functioning.
  fatal(5);

  @override
  @Deprecated('Use [level] for comparisons')
  int get index;

  /// Used to determine whether a message should be logged based on whether it
  /// is equal to or greater than the specified minimum log level.
  final int level;

  /// Constructs a `Level`.
  const Level(this.level);
}
