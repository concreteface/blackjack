require 'spec_helper'
describe PlayingCard do
	let(:card){card = PlayingCard.new('7', 'spades')}
	it 'has a rank' do
		expect(card.rank).to eq('7')
	end
	it 'has a suit' do
		expect(card.suit).to eq('spades')
	end
end