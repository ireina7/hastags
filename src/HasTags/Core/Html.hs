{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
module HasTags.Core.Html where
import HasTags.Data.XML (XML)
import qualified HasTags.Data.XML as XML
import Data.Foldable ( Foldable(foldl') )
import HasTags.Data.Property ( Property(Property) )
import HasTags.Data.Attribute ( Attribute(Attribute) )
import Data.List (intercalate)


newtype HtmlText =
    HtmlText {
        text :: String
    }
    deriving (Show, Eq, Ord)

class ToHtml m a where
    toHtml :: a -> m HtmlText



emptyTagNames :: [String]
emptyTagNames =
    [ "area"
    , "base"
    , "br"
    , "col"
    , "embed"
    , "hr"
    , "img"
    , "input"
    , "link"
    , "meta"
    , "param"
    , "source"
    , "track"
    , "wbr" ]


tagsToHtml :: XML -> Either String HtmlText
tagsToHtml xml = case xml of
    XML.Raw s -> Right $ HtmlText s
    XML.Tagged name props content -> do
        contents <- traverse tagsToHtml content
        return $ HtmlText $
            if name `notElem` emptyTagNames
            then
                "<" ++ name ++ properties ++ ">"
                    ++ intercalate "" (map text contents)
                    ++ "</" ++ name ++ ">"
            else
                "<" ++ name ++ properties ++ "/>"
        where
            properties = concatMap compileProp props
            compileProp (Property (Attribute name) v) =
                " " ++ name ++ "=" ++ show v

instance ToHtml (Either String) XML where
    toHtml = tagsToHtml



