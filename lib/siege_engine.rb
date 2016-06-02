class SiegeEngine < Unit
  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    if enemy.is_a?(Barracks) && can_attack?(enemy)
      enemy.damage(2 * attack_power) 
    elsif enemy.is_a?(SiegeEngine) 
      super(enemy)
    else
      enemy.damage(0) 
    end
  end

end