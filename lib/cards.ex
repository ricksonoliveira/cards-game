defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck cards.
  """

  @spec create_deck :: list
  @doc """
    Creates a deck of cards

  ## Examples

      iex> deck = Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "..."]
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

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.shuffle(deck)
      ["King of Hearts", "Two of Diamonds", "Ace of Spades"]
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @spec contains?(deck :: List, card :: String) :: boolean
  @doc """
    Check if a card contains in a deck.

  ## Examples

      iex> deck = Cards.create_deck
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
      iex> {hand, deck} = Cards.deal(deck, 1)
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

      iex> Cards.load(deck, "my_deck")
      {:ok, ["King of Hearts", "Two of Diamonds", "Ace of Spades", "..."]}
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

  ## Examples

      iex> Cards.create_hand(1)
      ["Ace of Spades"]
  """
  def create_hand(hand_size) do
    Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)
  end
end
