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
    player.cards.each do |card|
      puts "Player was dealt #{card.rank}#{card.suit}"
    end
    num_cards = 2
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
    if player.calculate_hand <= 21

      if player.calculate_hand == 21 && player.cards.length == 2
        puts "Blackjack! You win!"
      elsif player.calculate_hand == 21
        puts "You win!"
      else

        computer.cards.each do |card|
          puts "Computer was dealt #{card.rank}#{card.suit}"
        end
        computer_num_cards = 2
        while computer.calculate_hand < 21 && computer.calculate_hand <= player.calculate_hand
          puts "Computer score: #{computer.calculate_hand}"
          computer.hit
          computer_num_cards += 1
          puts "Computer was dealt #{computer.cards[computer_num_cards - 1].rank}#{computer.cards[computer_num_cards -1].suit}"
        end
        puts "Computer score: #{computer.calculate_hand}"
        if computer.calculate_hand > 21
          puts "The computer busted...you win!"
        elsif computer.calculate_hand > player.calculate_hand
          puts "Sorry, you lose"
        end
      end
    elsif player.calculate_hand > 21
      puts "You've gone bust (you lose)."
    end
  end
end

# BlackJack.new.game
