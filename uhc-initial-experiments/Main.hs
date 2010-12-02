module Main where

import JScript

main :: IO ()
main = alert $ stringToJSString "Hello, World!"
