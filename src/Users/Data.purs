module Users.Data
    ( User(..)
    ) where

newtype User =
    User { uuid :: Int
         , name :: String
         }
