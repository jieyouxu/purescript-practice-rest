module Test.Main where

import Prelude

import Effect (Effect)

import Test.Serialization.JSON.UserSerializationTest as SerialTest

main :: Effect Unit
main = do
    SerialTest.main
