module Puzzle exposing (..)

import Dict exposing (Dict)
import DictUtil exposing (swap)


type alias XY =
    ( Int, Int )


type Piece
    = Num Int
    | Blank


type alias Board =
    Dict XY Piece


addXY : XY -> XY -> XY
addXY ( x1, y1 ) ( x2, y2 ) =
    ( x1 + x2, y1 + y2 )


dirs : List XY
dirs =
    [ ( 0, -1 ), ( 1, 0 ), ( 0, -1 ), ( -1, 0 ) ]


isMove : XY -> XY -> Bool
isMove bxy xy =
    List.member xy <| List.map (\xy_ -> addXY bxy xy_) dirs


move : XY -> XY -> Piece -> Board -> Board
move bxy xy piece board =
    if isMove bxy xy then
        swap bxy Blank xy piece board
    else
        board
