module Update exposing (Msg(..), update)

import Dict
import Model exposing (Model, choices)


type Msg
    = Submit String
    | Reset


update : Msg -> Model -> Model
update msg _ =
    case msg of
        Submit value ->
            Dict.get value choices

        Reset ->
            Nothing
