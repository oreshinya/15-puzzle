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


clearBoard : Board
clearBoard =
    Dict.fromList
        [ ( ( 0, 0 ), Num 1 )
        , ( ( 1, 0 ), Num 2 )
        , ( ( 2, 0 ), Num 3 )
        , ( ( 3, 0 ), Num 4 )
        , ( ( 0, 1 ), Num 5 )
        , ( ( 1, 1 ), Num 6 )
        , ( ( 2, 1 ), Num 7 )
        , ( ( 3, 1 ), Num 8 )
        , ( ( 0, 2 ), Num 9 )
        , ( ( 1, 2 ), Num 10 )
        , ( ( 2, 2 ), Num 11 )
        , ( ( 3, 2 ), Num 12 )
        , ( ( 0, 3 ), Num 13 )
        , ( ( 1, 3 ), Num 14 )
        , ( ( 2, 3 ), Num 15 )
        , ( ( 3, 3 ), Blank )
        ]


isClear : Board -> Bool
isClear board =
    clearBoard == board
