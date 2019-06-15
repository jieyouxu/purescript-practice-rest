module Test.Serialization.JSON.UserSerializationTest where

import Prelude

import Data.Either (Either(..), isLeft, isRight)

import Effect (Effect)

import Test.Unit (describe, it)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

import Users.Data (User(..))

import Users.Serialization.JSON.UserSerialization
    ( decodeUserFromJSON
    , encodeUserToJSON
    )

main :: Effect Unit
main = runTest do
    describe "Serialize user as JSON" do
        it "should correctly serialize a user" do
            let user = User { uuid: 1, name: "John Doe" }
                actual = encodeUserToJSON user
                expected = "{\"uuid\":1,\"name\":\"John Doe\"}"
            Assert.equal expected actual
    describe "Deserialize user as JSON" do
        it "should handle empty string" do
            let result = decodeUserFromJSON ""
                reportsError = isLeft result
            Assert.assert "Should report error" reportsError
        it "should correctly deserialize a well-formed JSON as user" do
            let wellFormedStr = " { uuid: 1, name: \"John Doe\" } "
                actual = decodeUserFromJSON wellFormedStr
                expected = User { uuid: 1, name: "John Doe" }
            Assert.assert "Should successfully parse" (isRight actual)
            case actual of
                Right actualUser -> Assert.equal expected actualUser
                Left _ -> pure unit
