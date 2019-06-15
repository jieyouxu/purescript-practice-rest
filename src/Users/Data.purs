module Users.Data
    ( UserId
    , User
    ) where

import Prelude

type UserId = Int

newtype User = User
    { uuid: UserID,
    , name: String
    }
