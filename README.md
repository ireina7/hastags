# hastags
**HasTags** is a small, fast *XML/HTML/CSS* construction library for *Haskell* that takes fragments in plain Haskell code.

## Example
```haskell
import HasTags
toHtml $
  (tag "div") [attr "class" =: "example"] [
    (tag "h2") [raw "A simple example"]
  ]
```
