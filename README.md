
# Cards Game
### A game of cards with pure Elixir :D
Play the game fully on your command line terminal by typing `iex -S mix` inside the repo's directory.

Use the module `Cards` to play the game.

## Functions

Create a deck of cards like so:
```
deck = Cards.create_deck
```

Then shuffle the cards using:
```
deck = Cards.shuffle(deck)
```

Deal the cards using the deal function:
```
Cards.deal(deck, 5)
```
 Obs: *The above will deal a hand of 5 card to the player.*
 
 Check if the deck contains a card:
 ```
Cards.contains(deck, "King")
```
Obs: *The above will return true or false if the card is contained in the deck.*