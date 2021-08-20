/// Determines how a message is to be printed
enum Level {
  /// Gray; Only for the developer to see.
  debug,
  /// Green; Indicative of a good reason for celebration
  success,
  /// Cyan; Normal flow of execution inside the code
  info,
  /// Yellow; What happened is bordering on being unacceptable
  warn,
  /// Red; The task must be aborted, but the component can keep functioning
  severe,
  /// Red on yellow background; The task must be aborted, and the component
  /// cannot keep functioning
  fatal,
}