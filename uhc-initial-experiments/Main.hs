module Main where

import JScript
import JScript.JQuery

main :: IO ()
main = putStrLn "Body content from main"

foreign export jscript "jQueryMain " jQueryMain :: IO ()

jQueryMain :: IO ()
jQueryMain = do showAlert
                sayHi
                showNeat

foreign export jscript "showAlert" showAlert :: IO ()

showAlert :: IO ()
showAlert = alert $ s2js "Hello, World!"

foreign export jscript "sayHi" sayHi :: IO ()

sayHi :: IO ()
sayHi =  
    do j <- select $ s2js "body"
       setHTML j $ s2js "Hi there!"

foreign export jscript "showNeat" showNeat :: IO ()

showNeat :: IO ()
showNeat = 
    do j <- select $ s2js "p.neat"
       addClass j $ s2js "ohmy" 
       jQShow j $ s2js "slow"
