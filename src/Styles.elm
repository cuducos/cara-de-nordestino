module Styles exposing (addFooter, addTitle, asCard, button, darkColor, lightColor, primary, secondary)

import Element
    exposing
        ( Attribute
        , Color
        , Element
        , alignBottom
        , alignRight
        , alpha
        , centerX
        , centerY
        , fill
        , height
        , link
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


asCard : List (Attribute Msg)
asCard =
    [ centerY
    , centerX
    , width (fill |> maximum 768)
    ]


addTitle : List (Element Msg) -> List (Element Msg)
addTitle contents =
    row [ fontSize 5 ] [ text "Você tem cara de nordestino?" ] :: contents


addFooter : Element Msg -> Element Msg
addFooter contents =
    let
        footer : Element Msg
        footer =
            row [ alignBottom, alignRight ]
                [ link
                    [ alignBottom
                    , alignRight
                    , alpha 0.2
                    ]
                    { url = "https://github.com/cuducos/cara-de-nordestino"
                    , label = text "</>"
                    }
                ]
    in
    row [ width fill, height fill ] [ contents, footer ]
