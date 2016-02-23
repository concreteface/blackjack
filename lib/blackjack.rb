require_relative "deck"
require_relative "hand"

player = Hand.new
computer = Hand.new

puts 'Welcome to Blackjack!'
player.cards.each do |card|
  puts "Player was dealt #{card.rank}#{card.suit}"
end
num_cards = 2
while player.calculate_hand < 21
  puts "Player score: #{player.calculate_hand}"
  puts "Hit or Stand? (H/S)"
  choice = gets.chomp

  if choice.downcase == 'h'
    player.hit
    num_cards += 1
    puts "Player was dealt #{player.cards[num_cards - 1].rank}#{player.cards[num_cards -1].suit}"
  elsif choice.downcase == 's'

    puts "Player score: #{player.calculate_hand}"
    break
  end
end













# puts player.cards[0].rank
# puts player.cards[1].rank
# puts computer.cards[0].rank
# puts computer.cards[1].rank
# puts player.calculate_hand
# puts computer.calculate_hand
