module HasTags.Data.Attribute where


newtype Attribute =
    Attribute { name :: String }
    deriving (Show, Eq)

attribute :: String -> Attribute
attribute = Attribute

attr = attribute
