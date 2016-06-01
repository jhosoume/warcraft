class SiegeEngine < Unit
  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    if enemy.is_a?(Barracks) && !enemy.destroyed?
      enemy.damage(2*attack_power) 
    elsif enemy.is_a?(SiegeEngine) && !enemy.dead?
      super(enemy)
    else
      enemy.damage(0) 
    end
  end

end