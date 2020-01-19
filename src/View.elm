module View exposing (view)

import Dict
import Element
    exposing
        ( Element
        , column
        , layout
        , padding
        , row
        , spacing
        , wrappedRow
        )
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html)
import Model exposing (Model, choices)
import Styles exposing (addFooter, addTitle, asCard, button, darkColor, lightColor, primary, secondary)
import Update exposing (Msg(..))


question : List (Element Msg)
question =
    let
        buttons : List (Element Msg)
        buttons =
            choices
                |> Dict.keys
                |> List.map (\label -> button (Submit label) label)
    in
    [ secondary "Pergunta #1"
    , primary "Em qual estado ou distrito você nasceu?"
    , wrappedRow [ spacing 8 ] buttons
    ]


results : Bool -> List (Element Msg)
results result =
    let
        title : String
        title =
            if result then
                "Parabéns!"

            else
                "Desculpe"

        subtitle : String
        subtitle =
            if result then
                "Você tem 100% cara de nordestino!"

            else
                "Você não tem cara de nordestino."
    in
    [ secondary title
    , primary subtitle
    , row [] [ button Reset "Começar novamente" ]
    ]


view : Model -> Html Msg
view model =
    let
        contents : List (Element Msg)
        contents =
            case model of
                Just result ->
                    results result

                Nothing ->
                    question
    in
    contents
        |> addTitle
        |> column asCard
        |> addFooter
        |> layout
            [ Background.color lightColor
            , padding 64
            , Font.color darkColor
            , Font.family
                [ Font.external
                    { name = "Amatic SC"
                    , url = "https://fonts.googleapis.com/css?family=Amatic+SC:700&display=swap"
                    }
                ]
            ]
