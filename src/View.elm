module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (..)
import Models exposing (Model)
import Puzzle exposing (Board, LinearBoard, Piece(..), num, isMove, isBlank, isCorrect, clearBoard, toList)


view : Model -> Html Msg
view ({ board, blankXY } as model) =
    let
        boardList =
            toList board
    in
        div [ class "container" ] <| viewBoard model boardList


viewBoard : Model -> LinearBoard -> List (Html Msg)
viewBoard { board, blankXY } boardList =
    let
        correctStr xy piece =
            if isCorrect xy piece clearBoard then
                "correct"
            else
                "incorrect"

        moveStr xy =
            if isMove blankXY xy then
                "is-move"
            else
                "is-not-move"
    in
        List.map
            (\( ((x, y) as xy), piece ) ->
                if isBlank xy board then
                    a [ class "button is-static piece", style [ ("transform", "translate(" ++ (toString (73.5 * toFloat x)) ++ "px," ++ (toString (64.8 * toFloat y)) ++ "px)") ] ]
                        [ span [ class "icon is-medium" ] []
                        ]
                else
                    a [ class <| "button piece " ++ moveStr xy, style [ ("transform", "translate(" ++ (toString (73.5 * toFloat x)) ++ "px," ++ (toString (64.8 * toFloat y)) ++ "px)") ], onClick <| Move xy piece ]
                        [ span [ class "icon is-medium" ]
                            [ p [ class <| correctStr xy piece ++ " num" ] [ text <| toString <| num piece ]
                            ]
                        ]
            )
            boardList
