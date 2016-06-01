require_relative 'spec_helper.rb'

describe Barracks do
  before :each do 
    @barrack = Barracks.new
  end

  it "starts off with 500 lumber resources" do
    expect(@barrack.lumber).to eq(500)
  end

  describe "#can_train_siege?" do
    it "returns true if there are enough resources to train a siege" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple sieges
      expect(@barrack.can_train_siege?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 4 food items left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barrack).to receive(:food).and_return(2)
      expect(@barrack.can_train_siege?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 89 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barrack).to receive(:gold).and_return(199)
      expect(@barrack.can_train_siege?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      # Make the barracks believe it only has 89 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barrack).to receive(:lumber).and_return(59)
      expect(@barrack.can_train_siege?).to be_falsey
    end
  end

  describe "#train_siege" do
    it "does not train a siege if there aren't enough resources" do
      expect(@barrack).to receive(:can_train_siege?).and_return(false)
      expect(@barrack.train_siege).to be_nil
    end
    it "trains a siege if there are enough resources" do
      expect(@barrack).to receive(:can_train_siege?).and_return(true)
      expect(@barrack.train_siege).to be_a(SiegeEngine)
    end
  end
end

