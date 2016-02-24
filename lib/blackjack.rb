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
    show_player_hand
    hit_or_stand(2)
    result_calculator
  end
end

public

def computer_turn(player_score)
  show_computer_hand
  hit_or_stand_computer(2, player_score)
  puts "Computer score: #{computer_total}"
  result_calculator_computer
end

def result_calculator
  if player_total <= 21
    if player_total == 21 && player.cards.length == 2
      puts "Blackjack! You win!"
    elsif player_total == 21
      puts "You win!"
    else
      computer_turn(player_total)
    end
  elsif player_total > 21
    puts "You've gone bust (you lose)."
  end
end

def result_calculator_computer
  if computer_total > 21
    puts "The computer busted...you win!"
  elsif computer_total > player_total
    puts "Sorry, you lose"
  end
end

def show_player_hand
  player.cards.each do |card|
    puts "Player was dealt #{card.rank}#{card.suit}"
  end
end

def hit_or_stand(num_cards)
  stand = false
  while player_total < 21 && stand == false
    puts "Player score: #{player_total}"
    puts "Hit or Stand? (H/S)"
    choice = gets.chomp
    if choice.downcase == 'h'
      player.hit
      num_cards += 1
      puts "Player was dealt #{player.cards[num_cards - 1].rank}#{player.cards[num_cards -1].suit}"
    elsif choice.downcase == 's'
      puts "Player score: #{player_total}"
      stand = true
    end
  end
end


def show_computer_hand
  computer.cards.each do |card|
    puts "Computer was dealt #{card.rank}#{card.suit}"
  end
end

def hit_or_stand_computer(computer_num_cards, player_score)
  while computer_total < 21 && computer_total <= player_score
    puts "Computer score: #{computer_total}"
    computer.hit
    computer_num_cards += 1
    puts "Computer was dealt #{computer.cards[computer_num_cards - 1].rank}#{computer.cards[computer_num_cards -1].suit}"
  end
end

def computer_total
  computer.calculate_hand
end

def player_total
  player.calculate_hand
end

game = BlackJack.new.game

