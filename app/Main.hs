module Main where

import HasTags
import qualified HasTags.Data.XML as XML
import HasTags.Data.XML
import qualified HasTags.Data.Tags as Tags
import HasTags.Core.Html (HtmlText(HtmlText))

main :: IO ()
main = 
  print (toHtml src :: Either String HtmlText)
  where
    src = Tags.div [attr "class" =: "main", attr "style" =: "none;"] 
      [ Tags.h1 [] [raw "Hello!"]
      , Tags.img [attr "src" =: "./test.png"] []
      , Tags.span [attr "style" =: "color:red;"] [raw "World!"]
      ]

