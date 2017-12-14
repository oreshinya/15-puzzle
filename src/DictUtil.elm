module DictUtil exposing (swap)

import Dict exposing (Dict)


swap : comparable -> v -> comparable -> v -> Dict comparable v -> Dict comparable v
swap k1 v1 k2 v2 dict =
    dict |> Dict.update k1 (\_ -> Just v2) |> Dict.update k2 (\_ -> Just v1)
