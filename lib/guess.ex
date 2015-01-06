defmodule Guess do
    @moduledoc """
        Provides a base class for guess game
    """

    @doc """
        try a guess
    """
    def try(x, n) do
        case x == n do
            false when x > n ->
                :-
            false when x < n ->
                :+
            true ->
                :=
        end
    end
end
