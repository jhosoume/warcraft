class Unit
  attr_reader :health_points, :attack_power
  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def attack!(enemy)
    if dead? || enemy.dead?
      enemy.damage(0)
    else
      enemy.damage(attack_power)
    end
  end

  def damage(amount)
    @health_points -= amount
  end

  def dead?
    health_points <= 0
  end
end