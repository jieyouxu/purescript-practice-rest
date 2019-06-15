module Users.Serialization.JSON.UserSerialization
    ( encodeUserToJSON
    , decodeUserFromJSON
    ) where

import Prelude

import Data.Either (Either(..))
import Simple.JSON as JSON
import Users.User (User(..))

-- | Ensures DTO do not interfere with core business domain `User`.
type UserDTO =
    { uuid :: Int
    , name :: String
    }

toDTO :: User -> UserDTO
toDTO (User { uuid, name }) = { uuid, name }

fromDTO :: UserDTO -> User
fromDTO ({ uuid, name }) = User { uuid, name }

-- | Serializes a `User` to a JSON representation.
encodeUserToJSON :: User -> String
encodeUserToJSON = toDTO >>> JSON.writeJSON

-- | Deserialize a JSON object to a `User`.
-- | All redundant whitespace must be discarded; all object keys must be quoted
-- | with double quotes `"key": {value}`.
decodeUserFromJSON :: String -> Either String User
decodeUserFromJSON str = do
    case JSON.readJSON str of
        Left err -> do
            Left ("Could not parse JSON: " <> show err)
        Right (r :: UserDTO) -> do
            Right (fromDTO r)
