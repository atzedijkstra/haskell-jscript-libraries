module JScript.Array
  ( JSArray
  , jsArrayToArray
  
  , lengthJSArray
  , indexJSArray
  )
  where

import UHC.BoxArray
import UHC.Array

type JSArray x = BoxArray x

foreign import jscript "%1.length" lengthJSArray 	:: JSArray x -> Int

indexJSArray :: JSArray x -> Int -> x
indexJSArray = indexArray

jsArrayToArray :: JSArray x -> Array Int x
jsArrayToArray a
  = Array 0 (l-1) l a
  where l = lengthJSArray a
