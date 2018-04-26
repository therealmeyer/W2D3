class Card
  attr_reader :value, :suit
  SUITS = [:S, :H, :C, :D]
  VALUES = {
    1 => "A",  2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6",
    7 => "7", 8 => "8", 9 => "9", 10 => "10", 11 => "J", 12 => "Q", 13 => "K"
  }

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

end


class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.keys.each do |value|
        @cards << Card.new(value, suit)
      end
    end
    @cards
  end

  def shuffle
    @cards.shuffle!
  end
end

class Hand
  attr_reader :my_cards

  def initialize(cards)
    @my_cards = cards
  end

  def pair?
    (0...4).each do |card_idx1|
      ((card_idx1 + 1)...5).each do |card_idx2|
        return true if @my_cards[card_idx1].value == @my_cards[card_idx2].value
      end
    end

    false
  end

  def three_of_a_kind?
    card_vals = card_values
    card_vals.each do |val|
      return true if card_vals.count(val) >= 3
    end
    false
  end

  def card_values
    all_cards = []
    all_cards = @my_cards.map do |card|
      card.value
    end
    all_cards
  end
end
