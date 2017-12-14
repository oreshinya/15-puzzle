module Tests exposing (..)

import Test exposing (..)
import TestExp exposing (..)
import Dict


-- Test target modules

import Puzzle exposing (Piece(..), move, isClear)


all : Test
all =
    describe "Puzzle module Test"
        [ "move success"
            => move ( 1, 0 )
                ( 0, 0 )
                (Num 1)
                (Dict.fromList
                    [ ( ( 0, 0 ), Num 1 )
                    , ( ( 1, 0 ), Blank )
                    , ( ( 2, 0 ), Num 2 )
                    , ( ( 3, 0 ), Num 3 )
                    , ( ( 0, 1 ), Num 4 )
                    , ( ( 1, 1 ), Num 5 )
                    , ( ( 2, 1 ), Num 6 )
                    , ( ( 3, 1 ), Num 7 )
                    , ( ( 0, 2 ), Num 8 )
                    , ( ( 1, 2 ), Num 9 )
                    , ( ( 2, 2 ), Num 10 )
                    , ( ( 3, 2 ), Num 11 )
                    , ( ( 0, 3 ), Num 12 )
                    , ( ( 1, 3 ), Num 13 )
                    , ( ( 2, 3 ), Num 14 )
                    , ( ( 3, 3 ), Num 15 )
                    ]
                )
            === Dict.fromList
                    [ ( ( 0, 0 ), Blank )
                    , ( ( 1, 0 ), Num 1 )
                    , ( ( 2, 0 ), Num 2 )
                    , ( ( 3, 0 ), Num 3 )
                    , ( ( 0, 1 ), Num 4 )
                    , ( ( 1, 1 ), Num 5 )
                    , ( ( 2, 1 ), Num 6 )
                    , ( ( 3, 1 ), Num 7 )
                    , ( ( 0, 2 ), Num 8 )
                    , ( ( 1, 2 ), Num 9 )
                    , ( ( 2, 2 ), Num 10 )
                    , ( ( 3, 2 ), Num 11 )
                    , ( ( 0, 3 ), Num 12 )
                    , ( ( 1, 3 ), Num 13 )
                    , ( ( 2, 3 ), Num 14 )
                    , ( ( 3, 3 ), Num 15 )
                    ]
        , "move failed"
            => move ( 1, 0 )
                ( 0, 2 )
                (Num 1)
                (Dict.fromList
                    [ ( ( 0, 0 ), Num 1 )
                    , ( ( 1, 0 ), Blank )
                    , ( ( 2, 0 ), Num 2 )
                    , ( ( 3, 0 ), Num 3 )
                    , ( ( 0, 1 ), Num 4 )
                    , ( ( 1, 1 ), Num 5 )
                    , ( ( 2, 1 ), Num 6 )
                    , ( ( 3, 1 ), Num 7 )
                    , ( ( 0, 2 ), Num 8 )
                    , ( ( 1, 2 ), Num 9 )
                    , ( ( 2, 2 ), Num 10 )
                    , ( ( 3, 2 ), Num 11 )
                    , ( ( 0, 3 ), Num 12 )
                    , ( ( 1, 3 ), Num 13 )
                    , ( ( 2, 3 ), Num 14 )
                    , ( ( 3, 3 ), Num 15 )
                    ]
                )
            === Dict.fromList
                    [ ( ( 0, 0 ), Num 1 )
                    , ( ( 1, 0 ), Blank )
                    , ( ( 2, 0 ), Num 2 )
                    , ( ( 3, 0 ), Num 3 )
                    , ( ( 0, 1 ), Num 4 )
                    , ( ( 1, 1 ), Num 5 )
                    , ( ( 2, 1 ), Num 6 )
                    , ( ( 3, 1 ), Num 7 )
                    , ( ( 0, 2 ), Num 8 )
                    , ( ( 1, 2 ), Num 9 )
                    , ( ( 2, 2 ), Num 10 )
                    , ( ( 3, 2 ), Num 11 )
                    , ( ( 0, 3 ), Num 12 )
                    , ( ( 1, 3 ), Num 13 )
                    , ( ( 2, 3 ), Num 14 )
                    , ( ( 3, 3 ), Num 15 )
                    ]
        , "final move"
            => isClear
                (move ( 2, 3 )
                    ( 3, 3 )
                    (Num 15)
                    (Dict.fromList
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
                        , ( ( 2, 3 ), Blank )
                        , ( ( 3, 3 ), Num 15 )
                        ]
                    )
                )
            === True
        ]
