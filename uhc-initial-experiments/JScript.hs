module JScript
  ( module JScript.Array
  , module JScript.String
  , module JScript.HTML.DOM
  
  , typeof
  , alert
  )
  where

import JScript.Array
import JScript.String
import JScript.HTML.DOM

foreign import jscript "typeof(%*)" typeof :: forall a . a -> JSString
foreign import jscript alert :: JSString -> IO ()
