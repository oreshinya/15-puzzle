module Models exposing (..)

import Puzzle exposing (Board, XY)
import Dict


type alias Model =
    { board : Board, blank : XY }


initialModel : Model
initialModel =
    { board = Dict.empty, blank = ( 3, 3 ) }
