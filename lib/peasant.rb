class Peasant < Unit
  def initialize
    super(35, 0)
  end

  def attack!(enemy)
    # enemy.damage((attack_power/2.0).ceil) if enemy.is_a?(Barracks)
    enemy.damage(5)
  end
end