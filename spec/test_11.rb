require_relative 'spec_helper.rb'


describe Barracks do

  before :each do 
    @barrack = Barracks.new
  end

  it "has and knows its HP" do
    expect(@barrack.health_points).to eq(500)    
  end

  describe "#damage" do
    it "only receives Fixnum" do
      expect { @barrack.damage(1.2) }.to raise_error TypeError 
    end
    it "only receives damage" do
      @barrack.damage(5)
      expect(@barrack.health_points).to eq(495)       
    end
    it "is damaged by half from Footman" do
      enemy = Footman.new    
      expect(@barrack).to receive(:damage).with(5)
      enemy.attack!(@barrack)
    end

  end
end
