module Styles exposing (asCard, button, darkColor, lightColor, prependTitle, primary, secondary)

import Element
    exposing
        ( Attribute
        , Color
        , Element
        , centerX
        , centerY
        , fill
        , maximum
        , modular
        , mouseOver
        , padding
        , paddingEach
        , rgb255
        , rotate
        , row
        , text
        , width
        )
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input
import Update exposing (Msg)


darkColor : Color
darkColor =
    rgb255 32 31 26


lightColor : Color
lightColor =
    rgb255 234 232 215


darkRed : Color
darkRed =
    rgb255 50 12 6


fontSize : Int -> Attribute Msg
fontSize scale =
    scale
        |> modular 18 1.382
        |> round
        |> Font.size


button : Msg -> String -> Element Msg
button msg label =
    Input.button
        [ Background.color darkColor
        , Font.color lightColor
        , fontSize 3
        , padding 8
        , rotate -0.017
        , mouseOver [ Background.color darkRed ]
        ]
        { onPress = Just msg, label = text label }


textBlock : Int -> Int -> Int -> String -> Element Msg
textBlock size top bottom value =
    row
        [ width fill
        , fontSize size
        , paddingEach { top = top, right = 0, left = 0, bottom = bottom }
        ]
        [ text value ]


primary : String -> Element Msg
primary =
    textBlock 3 0 32


secondary : String -> Element Msg
secondary =
    textBlock 2 32 0


prependTitle : List (Element Msg) -> List (Element Msg)
prependTitle contents =
    row [ fontSize 5 ] [ text "Você tem cara de nordestino?" ] :: contents


asCard : List (Attribute Msg)
asCard =
    [ centerY
    , centerX
    , width (fill |> maximum 768)
    ]
