module View exposing (view)

import Dict
import Element
    exposing
        ( Attribute
        , Color
        , Element
        , centerX
        , centerY
        , column
        , fill
        , layout
        , maximum
        , modular
        , mouseOver
        , padding
        , paddingEach
        , rgb255
        , rotate
        , row
        , spacing
        , text
        , width
        , wrappedRow
        )
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Model exposing (Model, choices)
import Update exposing (Msg(..))


darkColor : Color
darkColor =
    rgb255 32 31 26


lightColor : Color
lightColor =
    rgb255 234 232 215


darkRed : Color
darkRed =
    rgb255 50 12 6


button : Msg -> String -> Element Msg
button msg label =
    Input.button
        [ Background.color darkColor
        , Font.color lightColor
        , Font.size 24
        , padding 8
        , rotate -0.017
        , mouseOver [ Background.color darkRed ]
        ]
        { onPress = Just msg, label = text label }


textBlock : Int -> Int -> Int -> String -> Element Msg
textBlock size top bottom value =
    row
        [ width fill
        , Font.size size
        , paddingEach { top = top, right = 0, left = 0, bottom = bottom }
        ]
        [ text value ]


primary : String -> Element Msg
primary =
    textBlock 32 0 32


secondary : String -> Element Msg
secondary =
    textBlock 18 32 0


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


prependTitle : List (Element Msg) -> List (Element Msg)
prependTitle contents =
    row [ Font.size 64 ] [ text "Você tem cara de nordestino?" ] :: contents


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

        card : List (Attribute Msg)
        card =
            [ centerY
            , centerX
            , width (fill |> maximum 768)
            ]
    in
    contents
        |> prependTitle
        |> column card
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
