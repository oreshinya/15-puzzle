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
        correct xy piece =
            if isCorrect xy piece clearBoard then
                "correct"
            else
                "incorrect"
    in
        List.map
            (\( xy, piece ) ->
                if isBlank xy board then
                    a [ class "button is-static piece" ]
                        [ span [ class "icon is-medium" ] []
                        ]
                else if isMove blankXY xy then
                    a [ class "button is-move piece", onClick <| Move xy piece ]
                        [ span [ class "icon is-medium" ]
                            [ p [ class (correct xy piece ++ " num") ] [ text <| toString <| num piece ]
                            ]
                        ]
                else
                    a [ class "button is-not-move piece", onClick <| Move xy piece ]
                        [ span [ class "icon is-medium" ]
                            [ p [ class (correct xy piece ++ " num") ] [ text <| toString <| num piece ]
                            ]
                        ]
            )
            boardList
