# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit
  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    super(60, 10)
  end

  def attack!(enemy)
    # if can_attack?(enemy) you should have this method in unit class
    if enemy.is_a?(Barracks) && can_attack?(enemy)
      enemy.damage((attack_power / 2.0).ceil) 
    else
      super(enemy)
    end
  end

end
