require 'towers'
require 'rspec'

RSpec.describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do
    it "assigns the towers instance variable to starting game position" do
      expect(game.towers).to eq([[3,2,1],[],[]])
    end
  end


  describe "#play" do
    it "checks if game has been won by calling #won?" do
      expect(game).to receive(:won?)
      game.play
    end

    it "prompts the user for input by calling #prompt_user" do
      expect(game).to receive(:prompt_user)
      game.play
    end

    it "renders the board by calling #render" do
      expect(game).to receive(:render)
      game.play
    end

    it "checks for a valid move by calling #valid_move?" do
      expect(game).to receive(:valid_move?)
      game.play
    end

    it "makes a move on the board by calling #move" do
      expect(game).to receive(:move)
      game.play
    end

    it "ends the game by calling #game_over" do
      expect(game).to receive(:game_over)
      game.play
    end
  end
  #
  describe "#won?" do
    let (:won_board) { [[],[3,2,1], []] }
    it "checks that the first column is empty" do
      expect(game.)
    end
  end

  # describe "#render" do
  #   it do
  #
  #   end
  # end
  #
  #
  # describe "#valid_move?" do
  #   it do
  #
  #   end
  # end
  #
  describe "#move" do
    it "moves a ring to another tower" do
      game.move(0,1)
      expect(game.towers).to eq([[3,2],[1],[]])
    end
  end


end
