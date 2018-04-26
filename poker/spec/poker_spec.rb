require 'poker'
require 'rspec'

RSpec.describe Card do
  subject(:card) { Card.new(5, :S) }

  describe "#initialize" do

    it "card values are Fixnums" do
      expect(card.value.is_a?(Fixnum)).to be_truthy
    end

    it "sets the value to the card" do
      expect(card.value).to eq(5)
    end

    it "sets a suit to the card" do
      expect(card.suit).to eq(:S)
    end

  end
end

RSpec.describe Deck do
  subject(:deck) { Deck.new }
  let(:cards) { deck.cards }

  describe "#initialize" do

    it "includes an array of Cards" do
      cards.each { |card| expect(card).to be_an_instance_of(Card) }
    end

    it "contains 52 cards" do
      expect(deck.cards.count).to eq(52)
    end

    it "contains 52 different cards" do
      expect(cards.uniq.count).to eq(52)
    end

    it "only contains card values from 1 to 13" do
      cards.each { |card| expect(card.value).to be_between(1,13) }
    end

    it "only contains suits: :S, :H, :C, :D" do
      cards.each { |card| expect([:S,:H,:C,:D]).to include(card.suit)}
    end

  end

  describe "#shuffle" do
    it "shuffles the deck in random order" do
      expect(deck.shuffle).not_to eq(deck)
    end

  end

end

RSpec.describe Hand do

  let(:card1) { Card.new(1,:S) }
  let(:card2) { Card.new(2,:S) }
  let(:card3) { Card.new(3,:S) }
  let(:card4) { Card.new(4,:S) }
  let(:card5) { Card.new(5,:S) }
  let(:card6) { Card.new(5,:S) }
  let(:card7) { Card.new(5,:S) }
  let(:card8) { Card.new(4,:S) }
  subject(:hand) { Hand.new([card1, card2,card3, card4, card5]) }
  describe "#initialize" do
    it "contains five unique cards" do
      expect(hand.my_cards.count).to eq(5)
    end
  end

  describe "#pair?" do
    context "when the hand does NOT contain a pair" do
      let(:bad_pair) { Hand.new([card1, card2,card3, card4, card5]) }
      it "returns false if the hand does not contain a pair" do
        expect(bad_pair.pair?).to be_falsey
      end
    end

    context "when the hand contains a pair" do
      let(:good_pair) { Hand.new([card1, card2,card3, card5, card6]) }
      it "returns true if the hand contains a pair" do
        expect(good_pair.pair?).to be_truthy
      end
    end

  end

  describe "#card_values" do
    it "returns an Array of card values" do
      expect(hand.card_values).to eq([1,2,3,4,5])
    end
  end

  describe "#three_of_a_kind?" do
    context "when the hand does not contains a three-of-a-kind" do
      let(:bad_three) { Hand.new([card1, card2,card3, card5, card6]) }
      it "returns false if the hand does not contain three_of_a_kind" do
        expect(bad_three.three_of_a_kind?).to be_falsey
      end
    end

    context "when the hand contains a three-of-a-kind" do
      let(:good_three) { Hand.new([card1, card2, card5, card6, card7]) }
      it "returns true if the hand contains three_of_a_kind" do
        expect(good_three.three_of_a_kind?).to be_truthy
      end
    end
  end

  describe "#two_pair?" do
    let(:bad_two_pair) { Hand.new([card1, card2,card3, card5, card6]) }
    it "returns false if the hand does not contain two-pair" do
      expect(bad_two_pair.two_pair?).to be_falsey
    end
    let(:good_two_pair) { Hand.new([card4, card5, card6, card7, card8]) }
    it "returns true if the hand contains two-pair" do
      expect(good_two_pair.two_pair?).to be_truthy
    end

  end


end
