module Main where

import JScript
import JScript.JQuery

main :: IO ()
main = return ()

-- Main function
foreign export jscript "jQueryMain" jQueryMain :: IO ()

jQueryMain :: IO ()
jQueryMain = do showAlert
                sayHi
                addNeat
                showNeat

-- Show an alert
foreign export jscript "showAlert" showAlert :: IO ()

showAlert :: IO ()
showAlert = alert $ s2js "Hello, World!"

-- Set the contents for to the body element.
foreign export jscript "sayHi" sayHi :: IO ()

sayHi :: IO ()
sayHi =  
    do j <- select $ s2js "body"
       setHTML j $ s2js "Hi there!"

-- Add a (hidden) paragraph to the body element.
foreign export jscript "addNeat" addNeat :: IO ()

addNeat :: IO ()
addNeat =
    do j <- select $ s2js "body"
       h <- getHTML j
       setHTML j $ s2js ((js2s h) ++ "<p class='neat'>"
                       ++ "<strong>Congratulations!</strong> This awesome "
                       ++ "jQuery script has been called by a function you have "
                       ++ "written in Haskell!</p>" )

-- Show the previously added paragraph using an animation.
foreign export jscript "showNeat" showNeat :: IO ()

showNeat :: IO ()
showNeat = 
    do j <- select $ s2js "p.neat"
       addClass j  $ s2js "ohmy" 
       jqshow   j  (Just slow) Nothing Nothing
       
