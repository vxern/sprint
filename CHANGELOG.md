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
