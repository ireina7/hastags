{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
module HasTags.Data.Property where

import qualified HasTags.Data.Attribute as Attr
import HasTags.Data.Attribute (Attribute, attribute)


data PropertyValue 
    = PInt Int
    | PNum Double
    | PStr String
    deriving (Eq)

instance Show PropertyValue where
    show v = case v of
        PInt i -> show i 
        PNum n -> show n 
        PStr s -> show s

data Property = 
    Property {
        name  :: Attr.Attribute,
        value :: PropertyValue
    }
    deriving (Eq)

instance Show Property where
    show (Property (Attr.Attribute name) value) =
        "(" ++ name ++ " = " ++ show value ++ ")" 



class Properties a where
    property :: Attribute -> a -> Property
    (=:) :: Attribute -> a -> Property
    name =: v = property name v

instance Properties Int where
    property attr i = Property attr (PInt i)

instance Properties Double where
    property attr n = Property attr (PNum n)

instance Properties String where
    property attr s = Property attr (PStr s)




