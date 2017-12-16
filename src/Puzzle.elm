module Puzzle exposing (..)

import Dict exposing (Dict)
import DictUtil exposing (swap)
import List.Extra exposing (zip)


type alias XY =
    ( Int, Int )


type Piece
    = Num Int
    | Blank


type alias Board =
    Dict XY Piece


type alias LinearBoard =
    List ( XY, Piece )


num : Piece -> Int
num piece =
    case piece of
        Num n ->
            n

        Blank ->
            -1


addXY : XY -> XY -> XY
addXY ( x1, y1 ) ( x2, y2 ) =
    ( x1 + x2, y1 + y2 )


dirs : List XY
dirs =
    [ ( 0, -1 ), ( 1, 0 ), ( 0, 1 ), ( -1, 0 ) ]


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


coordinates : List XY
coordinates =
    [ ( 0, 0 )
    , ( 1, 0 )
    , ( 2, 0 )
    , ( 3, 0 )
    , ( 0, 1 )
    , ( 1, 1 )
    , ( 2, 1 )
    , ( 3, 1 )
    , ( 0, 2 )
    , ( 1, 2 )
    , ( 2, 2 )
    , ( 3, 2 )
    , ( 0, 3 )
    , ( 1, 3 )
    , ( 2, 3 )
    , ( 3, 3 )
    ]


isBlank : XY -> Board -> Bool
isBlank xy board =
    compareBoard xy Blank board


isCorrect : XY -> Piece -> Board -> Bool
isCorrect xy piece board =
    compareBoard xy piece board


compareBoard : XY -> Piece -> Board -> Bool
compareBoard xy piece board =
    Dict.get xy board == Just piece


isClear : Board -> Bool
isClear board =
    clearBoard == board


toList : Board -> LinearBoard
toList board =
    Dict.toList board |> List.sortBy (\( _, piece ) -> num piece)
    --Dict.toList board |> List.sortBy (\( ( x, y ), _ ) -> ( y, x ))


fromIntList : List Int -> Board
fromIntList intList =
    (intList |> List.map Num |> zip coordinates) ++ [ ( ( 3, 3 ), Blank ) ] |> Dict.fromList
