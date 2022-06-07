module HasTags.Data.XML where

import qualified HasTags.Data.Attribute as Attr
import qualified HasTags.Data.Property as Prop
import HasTags.Data.Property (Property)



data XML 
    = Raw String 
    | Tagged {
        name :: String,
        properties :: [Property], 
        content :: [XML]
    }
    deriving (Show)


tag :: String -> [Property] -> [XML] -> XML
tag = Tagged

raw :: String -> XML
raw = Raw

text = raw


