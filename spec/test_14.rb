require_relative 'spec_helper.rb'

describe SiegeEngine do
  before :each do
    @siege = SiegeEngine.new
  end
  
  it "has health points" do
    expect(@siege.health_points).to eq(400)
  end

  it "has attack power" do
    expect(@siege.attack_power).to eq(50)
  end

  describe "#attack!" do
    it "is ineffective against other units" do
      enemy = Unit.new(10, 10)
      expect(enemy).to receive(:damage).with(0)
      @siege.attack!(enemy)
    end

    it "does doubled damage to Barracks" do
      enemy = Barracks.new
      expect(enemy).to receive(:damage).with(100)
      @siege.attack!(enemy)
    end

    it "does normal damage to other SiegeEngine Units" do
      enemy = SiegeEngine.new
      expect(enemy).to receive(:damage).with(50)
      @siege.attack!(enemy)
    end
  end
end