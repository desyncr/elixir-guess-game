defmodule GuessTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "matches only the secret number" do
    assert Guess.try(45, 45) == :=
    assert Guess.try(45, 44) == :-
    assert Guess.try(45, 46) == :+
  end

end
