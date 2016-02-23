require 'spec_helper'
describe PlayingCard do
	card1 = PlayingCard.new('7', '♠')
	card2 = PlayingCard.new('A', '♥')
	it 'has a rank' do
		expect(card1.rank).to eq('7')
		expect(card2.rank).to eq('A')
	end
	it 'has a suit' do
		expect(card1.suit).to eq('♠')
		expect(card2.suit).to eq('♥')
	end
end