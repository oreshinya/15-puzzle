module Update exposing (..)

import Models exposing (Model)
import Messages exposing (..)
import Puzzle exposing (isMove, move, fromIntList)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ board, blankXY } as model) =
    case msg of
        Move xy piece ->
            if isMove blankXY xy then
                ( { model | board = move blankXY xy piece board, blankXY = xy }, Cmd.none )
            else
                ( model, Cmd.none )

        Shuffle intList ->
            ( { model | board = fromIntList intList }, Cmd.none )
