module Update exposing (Msg(..), update)

import Dict exposing (Dict)
import Model exposing (Model, choices)


type Msg
    = Submit String
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Submit value ->
            Dict.get value choices

        Reset ->
            Nothing
