module JScript.String
  ( JSString

  , stringToJSString
  , s2js
  , jsStringToString
  , js2s
  )
  where

type JSString = PackedString


foreign import prim "primStringToPackedString" stringToJSString :: String -> JSString
foreign import prim "primStringToPackedString" s2js :: String -> JSString

jsStringToString :: JSString -> String
jsStringToString = packedStringToString

js2s :: JSString -> String
js2s = jsStringToString
