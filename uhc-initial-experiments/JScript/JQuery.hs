module JScript.JQuery where

import JScript.String

data JQuery

fast = 200
slow = 600

foreign import jscript "$(%1)"       select  :: JSString -> IO JQuery
foreign import jscript "%1.html()"   getHTML :: JQuery -> IO JSString
foreign import jscript "%1.html(%2)" setHTML :: JQuery -> JSString -> IO ()
foreign import jscript "%1.hide()"   hide    :: JQuery -> IO ()
foreign import jscript "%1.addClass(%2)" addClass :: JQuery -> JSString -> IO () -- Or JQuery for chaining??? Does chaining even make sense?
foreign import jscript "%1.show(%2)"     jqshow   :: JQuery -> Int -> IO () -- TODO: make show speeds a datatype?

-- $("p.neat").addClass("ohmy").show("slow");
