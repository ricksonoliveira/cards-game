defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @spec create_deck :: list
  @doc """
    Creates a deck of cards
  """
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]
    suits = [
      "Spades", "Clubs", "Hearts", "Diamonds"
    ]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @spec shuffle(deck :: List) :: list
  @doc """
    Shuffles a deck of cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @spec contains?(deck :: List, card :: String) :: boolean
  @doc """
    Check if a card contains in a deck.
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @spec deal(deck :: List, hand_size :: integer()) :: {list, list}
  @doc """
    Deals a hand of card to the players.
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
