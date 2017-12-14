module Puzzle exposing (..)

import Dict exposing (Dict)


type alias XY =
    { x : Int, y : Int }


type Piece
    = Num Int
    | Blank


type alias Board =
    Dict XY Piece
