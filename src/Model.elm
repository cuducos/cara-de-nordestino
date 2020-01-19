module Model exposing (Model, choices)

import Dict exposing (Dict)


choices : Dict String Bool
choices =
    Dict.fromList
        [ ( "Acre", False )
        , ( "Alagoas", True )
        , ( "Amapá", False )
        , ( "Amazonas", False )
        , ( "Bahia", True )
        , ( "Ceará", True )
        , ( "Distrito Federal", False )
        , ( "Espírito Santo", False )
        , ( "Goiás", False )
        , ( "Maranhão", True )
        , ( "Mato Grosso do Sul", False )
        , ( "Mato Grosso", False )
        , ( "Minas Gerais", False )
        , ( "Paraná", False )
        , ( "Paraíba", True )
        , ( "Pará", False )
        , ( "Pernambuco", True )
        , ( "Piauí", True )
        , ( "Rio Grande do Norte", True )
        , ( "Rio Grande do Sul", False )
        , ( "Rio de Janeiro", False )
        , ( "Rondônia", False )
        , ( "Roraima", False )
        , ( "Santa Catarina", False )
        , ( "Sergipe", True )
        , ( "São Paulo", False )
        , ( "Tocantins", False )
        ]


type alias Model =
    Maybe Bool
