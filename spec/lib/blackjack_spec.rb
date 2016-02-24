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
    before do
      expect(blackjack_game).to receive(:gets).and_return('s').once
    end

    it 'welcomes the player' do
      expect{blackjack_game.game}.to output(/Welcome to Blackjack/).to_stdout
    end
  end
end
