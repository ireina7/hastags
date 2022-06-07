# hastags
**HasTags** is a small, fast `XML/HTML/CSS` construction library for 
**Haskell** that takes fragments in *plain Haskell code*.


## Example
```haskell
import HasTags
toHtml $
  (tag "section") [attr "class" =: "example"] [
    (tag "h2") [ 
      (tag "span") [attr "style" =: "color:red;"] [raw "A simple example"]
    ]
  ]
```
above can be simplified to
```haskell
import HasTags
import HasTags.Data.Tags (section, h2)
import HasTags.Data.Attributes (cls, style)
import qualified HasTags.Data.Tags as Tags
import qualified HasTags.Data.Attributes as Attrs
toHtml $
  section[cls =: "example"] 
    [ h2[Tags.span[style =: "color:red;"] [text "A simple example"]]
    ]
```
output
```html
<section class="example">
  <h2>
    <span style="color:red;">A simple example</span>
  </h2>
</section>
```