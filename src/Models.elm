module Models exposing (..)

import Puzzle exposing (Board, XY)
import Dict


type alias Model =
    { board : Board, blankXY : XY }


initialModel : Model
initialModel =
    { board = Dict.empty, blankXY = ( 3, 3 ) }
