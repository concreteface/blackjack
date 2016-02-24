require 'spec_helper'

describe BlackJack do
  let(:blackjack_game){ blackjack_game = BlackJack.new}
  it "has a deck" do
    expect(blackjack_game.deck).to be_a(Deck)
  end
  it "has a player hand" do
    expect(blackjack_game.player).to be_a(Hand)
  end
  it "has a computer hand" do
    expect(blackjack_game.computer).to be_a(Hand)
  end

  describe "#game" do
    it 'plays a blackjack game' do
      allow(blackjack_game).to receive(:gets).and_return('s').exactly(2).times
      expect{blackjack_game.game}.to output(/Welcome to Blackjack/).to_stdout
      expect{blackjack_game.game}.to output(/Player was dealt/).to_stdout
      allow(blackjack_game).to receive(:gets).and_return('h').at_least(2).times
      expect{blackjack_game.game}.to output(/Welcome to Blackjack/).to_stdout
      expect{blackjack_game.game}.to output(/Player was dealt/).to_stdout
    end
  end
end
