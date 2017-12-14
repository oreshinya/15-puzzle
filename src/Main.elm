module Main exposing (..)

import Html exposing (Html, program, div, p, text)


init : ( Model, Cmd Msg )
init =
    ( A, Cmd.none )


type Model
    = A


type Msg
    = N


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = (\_ _ -> ( A, Cmd.none ))
        , subscriptions = (\_ -> Sub.none)
        }


view : Model -> Html msg
view _ =
    div [] [ text "abbba" ]
