#!/usr/bin/env python

import random
from typing import List, Tuple, Union

Card = Union[Tuple[str, str], str]  # (Rank, Suit) or Joker


def flip_coin() -> str:
    """
    Flips a coin.

    :return: the result of a coin flip as a string: Heads or Tails.
    """
    return "Heads" if random.randint(0, 1) == 0 else "Tails"


def roll_die(sides: int) -> int:
    """
    Roll a single die with the given number of sides and return the face value.

    :param sides: Number of sides on the die (must be >= 2).
    :return: Random integer in [1, sides].
    :raises ValueError: If sides < 2.
    """
    if sides < 2:
        raise ValueError("Die must have at least 2 sides.")
    return random.randint(1, sides)


def build_deck(include_jokers: bool) -> List[Card]:
    """
    Build and shuffle a standard 52-card deck. Optionally include two Jokers.

    :param include_jokers: Whether to include Jokers in the deck.
    :return: A shuffled list of Card objects.
    """
    ranks = ["A"] + [str(n) for n in range(2, 11)] + ["J", "Q", "K"]
    suits = ["♠", "♥", "♦", "♣"]

    deck: List[Card] = [(r, s) for s in suits for r in ranks]
    if include_jokers:
        deck.append("Joker")
        deck.append("Joker")

    random.shuffle(deck)
    return deck


def draw_card(deck: List[Card]) -> Card:
    """
    Draw (pop) the top card from the deck. Assumes deck is non-empty.

    :param deck: The current deck list.
    :return: The drawn Card.
    :raises IndexError: If the deck is empty.
    """
    return deck.pop()


def pretty_card(card: Card) -> str:
    """
    Convert a Card into a printable string.

    :param card: ('Rank', 'Suit') or 'Joker'
    :return: Human-friendly string.
    """
    if isinstance(card, str):
        return card  # Joker
    rank, suit = card
    # Add simple names for face cards
    names = {"A": "Ace", "J": "Jack", "Q": "Queen", "K": "King"}
    rank_str = names.get(rank, rank)
    return f"{rank_str} of {suit}"


def prompt_menu() -> str:
    """
    Show the main menu and return the user's choice ('1', '2', '3', or 'q').
    """
    print("\n=== Simulator ===")
    print("1) Flip a coin")
    print("2) Roll a die")
    print("3) Draw a card")
    print("q) Quit")
    choice = input("Select an option: ").strip().lower()
    return choice


def prompt_die_sides(allowed=(6, 8, 10, 12)) -> int:
    """
    Prompt the user for a die size and validate that it is in the allowed set.

    :param allowed: Iterable of allowed side counts.
    :return: The selected number of sides.
    """
    allowed_str = ", ".join(str(x) for x in allowed)
    while True:
        raw = input(f"Choose die sides ({allowed_str}): ").strip()
        if not raw.isdigit():
            print("Please enter a number.")
            continue
        val = int(raw)
        if val in allowed:
            return val
        print(f"Only {allowed_str} are allowed.")


def prompt_yes_no(prompt: str) -> bool:
    """
    Generic yes/no prompt.

    :param prompt: The question to ask (e.g., 'Include jokers? (y/n): ')
    :return: True for yes, False for no.
    """
    while True:
        ans = input(prompt).strip().lower()
        if ans in ("y", "yes"):
            return True
        if ans in ("n", "no"):
            return False
        print("Please answer 'y' or 'n'.")


def main() -> None:
    # State for the card drawing option
    include_jokers = False
    deck: List[Card] = []  # Empty until the first time the user draws

    while True:
        choice = prompt_menu()

        if choice == "1":
            result = flip_coin()
            print(f"Result: {result}")

        elif choice == "2":
            sides = prompt_die_sides()
            value = roll_die(sides)
            print(f"You rolled a {value} on a d{sides}.")

        elif choice == "3":
            want_jokers = prompt_yes_no("Include jokers in the deck? (y/n): ")
            if deck == [] or want_jokers != include_jokers:
                include_jokers = want_jokers
                deck = build_deck(include_jokers)
                print("(Shuffled a new deck.)")

            if not deck:
                deck = build_deck(include_jokers)

            card = draw_card(deck)
            print(f"You drew: {pretty_card(card)}")
            print(f"Cards left in deck: {len(deck)}")
            if len(deck) == 0:
                print("Deck is empty. It will rebuild automatically next time.")

        elif choice == "q":
            print("Goodbye!")
            break

        else:
            print("Not a valid option.")


if __name__ == "__main__":
    main()