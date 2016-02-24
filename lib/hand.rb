require_relative 'deck'

class Hand
  attr_accessor :cards
  attr_reader :deck
  def initialize(deck)
    @deck = deck
    @cards = deck.deal(2)
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

  def hit
    @cards << deck.deal(1)[0]
  end
end
