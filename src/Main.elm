module Main exposing (..)

import Html exposing (Html, program, div, p, text)
import View exposing (view)
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Update exposing (update)
import Random
import Random.List as RandomList


init : ( Model, Cmd Msg )
init =
    ( initialModel, Random.generate Shuffle <| RandomList.shuffle <| List.range 1 15 )


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
