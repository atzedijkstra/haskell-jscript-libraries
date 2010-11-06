module JScript.String
  ( JSString

  , stringToJSString
  , jsStringToString
  )
  where

type JSString = PackedString


foreign import prim "primStringToPackedString" stringToJSString :: String -> JSString

jsStringToString :: JSString -> String
jsStringToString = packedStringToString
