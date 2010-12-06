module JScript.JQuery where

import JScript.String

data JQuery

foreign import jscript "$(%1)"       select  :: JSString -> IO JQuery
foreign import jscript "%1.html()"   getHTML :: JQuery -> IO JSString
foreign import jscript "%1.html(%2)" setHTML :: JQuery -> JSString -> IO ()
foreign import jscript "%1.hide()"   hide    :: JQuery -> IO ()

