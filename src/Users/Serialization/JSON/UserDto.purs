module Users.Serialization.JSON.UserDto
    ( encodeUserToJSON
    , decodeUserFromJSON
    ) where

import Prelude

import Data.Either (Either(..))
import Effect.Class.Console (error)
import Simple.JSON as JSON
import Users.Data (User(..))

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
decodeUserFromJSON :: String -> Either String User
decodeUserFromJSON str = do
    case JSON.readJSON str of
        Left err -> do Left ("Could not parse JSON: " <> show err)
        Right (r :: UserDTO) -> do Right (fromDTO r)
