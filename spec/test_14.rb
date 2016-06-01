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
      enemy = Unite.new(10, 10)
      expect(enemy).to receive(:damage).with(0)
    end
  end

  describe "damage" do
  end
end