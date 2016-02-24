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

def computer_turn(player_score)
  show_computer_hand
  hit_or_stand_computer(2, player.calculate_hand)
  puts "Computer score: #{computer.calculate_hand}"
  result_calulator_computer
end

def result_calculator
  if player.calculate_hand <= 21
    if player.calculate_hand == 21 && player.cards.length == 2
      puts "Blackjack! You win!"
    elsif player.calculate_hand == 21
      puts "You win!"
    else
      computer_turn(player.calculate_hand)
    end
  elsif player.calculate_hand > 21
    puts "You've gone bust (you lose)."
  end
end

def result_calulator_computer
  if computer.calculate_hand > 21
    puts "The computer busted...you win!"
  elsif computer.calculate_hand > player.calculate_hand
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
  while player.calculate_hand < 21 && stand == false
    puts "Player score: #{player.calculate_hand}"
    puts "Hit or Stand? (H/S)"
    choice = gets.chomp
    if choice.downcase == 'h'
      player.hit
      num_cards += 1
      puts "Player was dealt #{player.cards[num_cards - 1].rank}#{player.cards[num_cards -1].suit}"
    elsif choice.downcase == 's'
      puts "Player score: #{player.calculate_hand}"
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
  while computer.calculate_hand < 21 && computer.calculate_hand <= player_score
    puts "Computer score: #{computer.calculate_hand}"
    computer.hit
    computer_num_cards += 1
    puts "Computer was dealt #{computer.cards[computer_num_cards - 1].rank}#{computer.cards[computer_num_cards -1].suit}"
  end
end
BlackJack.new.game
