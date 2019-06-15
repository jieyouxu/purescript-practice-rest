module Users.Data
    ( User(..)
    ) where

import Data.Eq (class Eq, (==))
import Data.Ord (class Ord, compare)

newtype User = User
    { uuid :: Int
    , name :: String
    }

instance eqUser :: Eq User where
    eq (User user1) (User user2) = user1.uuid == user2.uuid

instance ordUser :: Ord User where
    compare (User user1) (User user2) = user1.uuid `compare` user2.uuid
