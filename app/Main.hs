module Main where

import HasTags
import HasTags.Data.XML
import HasTags.Core.Html (HtmlText(HtmlText))
import qualified HasTags.Data.Tags as Tags
import qualified HasTags.Data.Attributes as Attrs
import HasTags.Data.Tags (div, h1, img, span, input)
import HasTags.Data.Attributes (cls, style, src, href, width)


main :: IO ()
main = do
    print (toHtml src :: Either String HtmlText)
    where
    src = Tags.div[cls =: "main", style =: "none;"] 
        [ h1[Attrs.id =: "h11"] [raw "Hello!"] 
        , input[width =: (100 :: Int)]
        , img[Attrs.src =: "./test.png"]
        , Tags.span[style =: "color:red;"] [raw "World!"]
        ]





