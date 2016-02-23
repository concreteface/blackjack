require_relative 'deck'

class Hand
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    sum = 0
    cards.each do |card|
      no_suit = card.rank
      sum += case no_suit
             when 'K', 'Q', 'J'
               10
             when 'A'
               if sum + 11 > 21
                 1
               else 11
               end
             else no_suit.to_i
      end
    end
    sum
  end
end

deck = Deck.new
deck.build_deck
hand = Hand.new(deck.deal(2))
puts hand.cards[0].suit

