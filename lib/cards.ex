defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck cards.
  """

  @spec create_deck :: list
  @doc """
    Creates a deck of cards

  ## Examples

      iex> Cards.create_deck()
      ["Ace of Spades", "Two of Spades", "Three of Spades",
      "Four of Spades", "Five of Spades", "Six of Spades",
      "Seven of Spades", "Eight of Spades", "Nine of Spades",
      "Ten of Spades", "Jack of Spades", "Queen of Spades",
      "King of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
      "Four of Clubs", "Five of Clubs", "Six of Clubs", "Seven of Clubs",
      "Eight of Clubs", "Nine of Clubs", "Ten of Clubs", "Jack of Clubs",
      "Queen of Clubs", "King of Clubs", "Ace of Hearts",
      "Two of Hearts", "Three of Hearts", "Four of Hearts",
      "Five of Hearts", "Six of Hearts", "Seven of Hearts",
      "Eight of Hearts", "Nine of Hearts", "Ten of Hearts",
      "Jack of Hearts", "Queen of Hearts", "King of Hearts",
      "Ace of Diamonds", "Two of Diamonds", "Three of Diamonds",
      "Four of Diamonds", "Five of Diamonds", "Six of Diamonds",
      "Seven of Diamonds", "Eight of Diamonds", "Nine of Diamonds",
      "Ten of Diamonds", "Jack of Diamonds", "Queen of Diamonds",
      "King of Diamonds"]
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
    Check if a deck contains a given card.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @spec deal(deck :: List, hand_size :: integer()) :: {list, list}
  @doc """
    Deals a hand of card to the player.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @spec save(
          any,
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | char,
              binary | []
            )
        ) :: :ok | {:error, atom}
  @doc """
    Saves a deck of cards.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.save(deck, "my_deck")
      :ok
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @spec load(
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | char,
              binary | []
            )
        ) :: any
  @doc """
    Loads a file that contains a deck and displays the deck.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.save(deck, "my_deck")
      iex> Cards.load("my_deck")
      ["Ace of Spades", "Two of Spades", "Three of Spades",
      "Four of Spades", "Five of Spades", "Six of Spades", "Seven of Spades",
      "Eight of Spades", "Nine of Spades", "Ten of Spades", "Jack of Spades",
      "Queen of Spades", "King of Spades", "Ace of Clubs", "Two of Clubs",
      "Three of Clubs", "Four of Clubs", "Five of Clubs", "Six of Clubs",
      "Seven of Clubs", "Eight of Clubs", "Nine of Clubs", "Ten of Clubs",
      "Jack of Clubs", "Queen of Clubs", "King of Clubs", "Ace of Hearts",
      "Two of Hearts", "Three of Hearts", "Four of Hearts", "Five of Hearts",
      "Six of Hearts", "Seven of Hearts", "Eight of Hearts", "Nine of Hearts",
      "Ten of Hearts", "Jack of Hearts", "Queen of Hearts", "King of Hearts",
      "Ace of Diamonds", "Two of Diamonds", "Three of Diamonds", "Four of Diamonds",
      "Five of Diamonds", "Six of Diamonds", "Seven of Diamonds", "Eight of Diamonds",
      "Nine of Diamonds", "Ten of Diamonds", "Jack of Diamonds", "Queen of Diamonds",
      "King of Diamonds"]
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exists"
    end
  end

  @spec create_hand(hand_size :: integer()) :: list
  @doc """
   Creates a shuffled dealt hand.
  """
  def create_hand(hand_size) do
    Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)
  end
end
