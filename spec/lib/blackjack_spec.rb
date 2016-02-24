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
    it 'welcomes the player' do
      allow(blackjack_game).to receive(:gets).and_return('s')
      expect{blackjack_game.game}.to output(/Welcome to Blackjack/).to_stdout
    end
  end

  # describe "#{computer_turn}" do
  #   it 'returns a result calculator' do
  #     expect(blackjack_game.computer_turn(18,19)).to eq(result_calculator_computer)
  #   end
  # end
  describe "#computer_total" do
    it "calculates the computer's hand" do
      expect(blackjack_game.computer_total).to be_a_kind_of(Integer)
    end
  end
  describe "#player_total" do
    it "calculates the player's hand" do
      expect(blackjack_game.player_total).to be_a_kind_of(Integer)
    end
  end

  describe "#show_computer_hand" do
    it "diplays the computer's starting hand" do
      expect{blackjack_game.show_computer_hand}.to output(/Computer was dealt/).to_stdout
    end
  end

  describe "#show_player_hand" do
    it "diplays the player's starting hand" do
      expect{blackjack_game.show_player_hand}.to output(/Player was dealt/).to_stdout
    end
  end

  # describe "#{hit_or_stand}" do
  #   it "accepts 's'" do
  #       blackjack_game.player_total = 18
  #       allow(blackjack_game).to receive(:gets).and_return('s')
  #       expect{blackjack_game.hit_or_stand(2)}.to output(/Player score/).to_stdout
  #   end
  # end
  # describe "#result_calculator" do
  #   it "tells you you're bust if you're over 21" do
  #       expect(blackjack_game.result_calculator).to be_a_kind_of(String)
  #   end

  # end


end
