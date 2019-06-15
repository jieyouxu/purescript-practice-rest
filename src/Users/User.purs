module Users.User
    ( User(..)
    ) where

import Prelude

newtype User = User
    { uuid :: Int
    , name :: String
    }

instance eqUser :: Eq User where
    eq (User user1) (User user2) = user1.uuid == user2.uuid

instance ordUser :: Ord User where
    compare (User user1) (User user2) = user1.uuid `compare` user2.uuid

instance showUser :: Show User where
    show (User user) =
        "User "
        <> "{ "
        <> "uuid: " <> show user.uuid
        <> ", "
        <> "name: " <> user.name
        <> " }"
