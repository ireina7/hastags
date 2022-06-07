{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
module HasTags.Core.Html where
import HasTags.Data.XML (XML)
import qualified HasTags.Data.XML as XML
import Data.Foldable ( Foldable(foldl') )
import HasTags.Data.Property ( Property(Property) )
import HasTags.Data.Attribute ( Attribute(Attribute) )


newtype HtmlText =
    HtmlText String
    deriving (Show, Eq, Ord)

class ToHtml m a where
    toHtml :: a -> m HtmlText


tagsToHtml :: XML -> Either String HtmlText
tagsToHtml xml = case xml of
    XML.Raw s -> Right $ HtmlText s
    XML.Tagged name props content ->
        Right $ HtmlText $ "<" ++ name ++ " " ++ propss ++ ">"
        where
            propss = foldl' (\ss (Property (Attribute name) v) -> ss ++ name ++ "=" ++ show v) "" props

instance ToHtml (Either String) XML where
    toHtml = tagsToHtml



