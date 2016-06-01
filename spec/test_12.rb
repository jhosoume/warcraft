require_relative 'spec_helper.rb'

describe Unit do
  before :each do
    @unit = Unit.new(0, 10) # Initializing a dead unit
  end

  describe "#dead?" do 
    it "returns true if the unit has no health points" do
      expect(@unit.dead?).to be_truthy
    end
    it "returns false if the unit has positive health points" do
      expect(@unit).to receive(:health_points).and_return(10)
      expect(@unit.dead?).to be_falsey
    end  
  end 

  describe "#attack!" do
    it "does deal damage when dead" do
      enemy = Footman.new
      expect(enemy).to receive(:damage).with(0)
      @unit.attack!(enemy) 
      # expect{ @unit.attack!(enemy) }.to raise_error ArgumentError => Better not to raise an error because it crashes the whole program
    end
  end

  describe "#damage" do
    it "does not receive damage when dead" do
      enemy = Footman.new
      expect(@unit).to receive(:damage).with(0)
      enemy.attack!(@unit)
    end
  end

end