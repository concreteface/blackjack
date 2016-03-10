require_relative "deck"
require_relative "hand"

class BlackJack
  attr_accessor :deck, :player, :computer

  def initialize
    @deck = Deck.new
    @player = Hand.new(@deck)
    @computer = Hand.new(@deck)
  end

  def game
    puts 'Welcome to Blackjack!'
    starting_hand_player
    num_cards = 2
    stand = false
    while calculate_score(player) < 21 && stand == false
      puts "Player score: #{calculate_score(player)}"
      puts "Hit or Stand? (H/S)"
      choice = gets.chomp
      if choice.downcase == 'h'
        player.hit
        num_cards += 1
        puts "Player was dealt #{player.cards[num_cards - 1].rank}#{player.cards[num_cards -1].suit}"
      elsif choice.downcase == 's'
        puts "Player score: #{calculate_score(player)}"
        stand = true
      end
    end
    if calculate_score(player) <= 21

      if calculate_score(player) == 21 && player.cards.length == 2
        puts "Blackjack! You win!"
      elsif calculate_score(player) == 21
        puts "You win!"
      else
        starting_hand_computer
        computer_num_cards = 2
        while calculate_score(computer) < 21 && calculate_score(computer) <= calculate_score(player)
          puts "Computer score: #{calculate_score(computer)}"
          computer.hit
          computer_num_cards += 1
          puts "Computer was dealt #{computer.cards[computer_num_cards - 1].rank}#{computer.cards[computer_num_cards -1].suit}"
        end
        puts "Computer score: #{calculate_score(computer)}"
        if calculate_score(computer) > 21
          puts "The computer busted...you win!"
        elsif calculate_score(computer) > calculate_score(player)
          puts "Sorry, you lose"
        end
      end
    elsif calculate_score(player) > 21
      puts "You've gone bust (you lose)."
    end
  end
end

def starting_hand_player
  player.cards.each do |card|
    puts "Player was dealt #{card.rank}#{card.suit}"
  end
end

def starting_hand_computer
  computer.cards.each do |card|
    puts "Computer was dealt #{card.rank}#{card.suit}"
  end
end

def calculate_score(whose)
  whose.calculate_hand
end
BlackJack.new.game
