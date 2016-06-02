class Unit
  attr_reader :health_points, :attack_power
  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def attack!(enemy)
    if can_attack?(enemy)
      enemy.damage(attack_power)
    else
      enemy.damage(0)
    end
  end

  def damage(amount)
    raise TypeError unless amount.is_a?(Fixnum)
    @health_points -= amount
  end

  def dead?
    health_points <= 0
  end

  def can_attack?(enemy)
    !dead? && !enemy.dead?  
  end
end