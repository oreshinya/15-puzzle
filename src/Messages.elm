module Messages exposing (..)

import Puzzle exposing (Board, XY, Piece)


type Msg
    = Move XY Piece
    | Shuffle (List Int)
