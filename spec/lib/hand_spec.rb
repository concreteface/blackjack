require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'
  let(:hand) { hand = Hand.new }

  describe "#calculate_hand" do
    it 'adds the cards in the hand together' do
    	hand.cards = [PlayingCard.new(10,'♦'), PlayingCard.new('Q', '♥')]
      expect(hand.calculate_hand).to eq(20)
      hand.cards = [PlayingCard.new('J','♥'), PlayingCard.new('A', '♥')]
      expect(hand.calculate_hand).to eq(21)
      hand.cards = [PlayingCard.new('J','♥'), PlayingCard.new('4', '♥'), PlayingCard.new('A', '♥')]
      expect(hand.calculate_hand).to eq(15)
      hand.cards = [PlayingCard.new('A', '♠'), PlayingCard.new('A', '♥'), PlayingCard.new('5', '♠')]
      expect(hand.calculate_hand).to eq(17)
      hand.cards = [PlayingCard.new('A', '♠'), PlayingCard.new('A', '♥'), PlayingCard.new('K', '♠')]
      expect(hand.calculate_hand).to eq(22)

      # hand.cards = ["10♦", "J♥", "A♣"]
      # expect(hand.calculate_hand).to eq(21)
      # hand.cards = ["10♦", "4♥", "A♣"]
      # expect(hand.calculate_hand).to eq(15)
      # hand.cards = ["Q♦", "A♥"]
      # expect(hand.calculate_hand).to eq(21)
      # hand.cards = ["A♣", "A♦", "A♠", "A♥", "K♥"]
      # expect(hand.calculate_hand).to eq(24)
    end
  end
end
