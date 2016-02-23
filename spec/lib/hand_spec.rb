require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'
  let(:hand) { hand = Hand.new }
  it 'has 2 playing card objects' do
    expect(hand.cards.length).to eq(2)
    expect(hand.cards[0]).to be_a(PlayingCard)
    expect(hand.cards[1]).to be_a(PlayingCard)
  end

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
    end
  end

  describe "#hit" do
    let(:hand) { hand = Hand.new }
    it 'adds a card to the hand' do
      hand.hit
      expect(hand.cards.length).to eq(3)
      hand.hit
      expect(hand.cards.length).to eq(4)
      hand.hit
      expect(hand.cards.length).to eq(5)
    end
  end
end
