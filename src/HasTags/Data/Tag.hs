{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}

module HasTags.Data.Tag where
import HasTags.Data.Property (Property)
import HasTags.Data.XML (XML(..))


class Tag attribute content where
    tag :: String -> [attribute] -> [content] -> XML


instance Tag Property XML where
    tag name props xmls =
        Tagged name props xmls

instance Tag Property String where
    tag name props ss =
        Tagged name props (map Raw ss)
