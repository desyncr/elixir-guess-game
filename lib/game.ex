defmodule Game do
    @moduledoc """
        Basic game wrapper
    """

    @doc """
        How many tries to allow
    """
    @max_tries 100

    @doc """
        Program entry point
    """
    def main(args) do
        IO.puts """
            Welcome to the guess game.

            You have #{@max_tries} tries to guess a random selected number.

            Have fun.

            Ctrl + C to leave.
        """
        :random.seed :erlang.now
        play :random.uniform 100
    end

    @doc """
        Plays until game is over
        @todo How to stop when the guy guesses correctly??
    """
    def play(n) do
        Enum.map(1..@max_tries, fn x ->
            try do
                {value, _}  = Integer.parse IO.gets "Enter your guess: "
                case Guess.try value, n do
                    :+ ->
                        IO.puts "Nope. Higher"
                    :- ->
                        IO.puts "Nope. Lower"
                    := ->
                        IO.puts "OMG you did it in " <> Integer.to_string(x) <> " tries"
                        IO.puts "Ctrl + C to quit"
                end
            catch
                _ -> IO.puts "whoops not a number"
            end

        end)
    end

end
