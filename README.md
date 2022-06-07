# hastags
**HasTags** is a small, fast *XML/HTML/CSS* construction library for *Haskell* that takes fragments in plain Haskell code.

## Example
```haskell
import HasTags
toHtml $
  (tag "div") [attr "class" =: "example"] [
    (tag "h2") [ 
      (tag "span") [attr "style" =: "color:red;"] [raw "A simple example"]
    ]
  ]
```
above can be simplified to
```haskell
toHtml $
  div [cls =: "example"] [
    h2 [
      span [style =: "color:red;"] ["A simple example"]
    ]
  ]
```
output
```html
<div class="example">
  <h2>
    <span style="color:red;">A simple example</span>
  </h2>
</div>
```