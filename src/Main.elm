module Main exposing (main)

import Browser
import Model exposing (Model)
import Update exposing (Msg, update)
import View exposing (view)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = Nothing
        , view = view
        , update = update
        }
