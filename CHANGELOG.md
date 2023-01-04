## 2.0.0

- Set the lower bound for the SDK version to `2.17.0`.
- Added a `minimumLogLevel` option to the constructor of the `Sprint` class.
- Deprecated the `productionMode` variable.
- Made the `includeTimestamp` field non-final.
- Deprecated the `index` field of `Level` and instructed the developer to use
  `level` instead.

## 1.0.4

- Switched from the `ansicolor` package to `tint`.
- Improved the mapping of log levels to colours.

## 1.0.3+2

- Updated description to fit Dart file conventions.

## 1.0.3+1

- Refactored and made formatting and style changes to the project to bring it up
  to par.

## 1.0.3

- Updated package description.
- Split `log()` into two methods `_printToConsole()` and `_printToTerminal()` of
  which one is assigned based on whether the program is running in a JavaScript
  environment or not.

## 1.0.2+4

- Updated package description.

## 1.0.2+3

- Fixed the issue with string concatenation taking precedence over string
  multiplication, which led to the production of large amounts of newlines,
  where only spaces were expected.

## 1.0.2+2

- Added missing documentation comment.

## 1.0.2+1

- Updated formatting.

## 1.0.2

- Refactored the code.
- Documented all public fields.
- Adapted the code to work with the `words` lint ruleset.

## 1.0.1

- Added quiet mode which prevents any messages from being printed.

## 1.0.0+2

- Bumped dev-dependency versions to latest.

## 1.0.0+1

- Formatted source in accordance with `dartfmt`.

## 1.0.0

- Initial release.
