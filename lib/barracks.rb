class Barracks
  attr_reader :gold, :food, :lumber, :health_points
  def initialize
    @gold = 1000
    @food = 80
    @lumber = 500
    @health_points = 500
  end

  def can_train_footman?
    gold >= 135 && food >= 2
  end

  def can_train_peasant?
    gold >= 90 && food >= 5 
  end

  def can_train_siege?
    gold >= 200 && food >= 3 && lumber >= 60 
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    else
      nil
    end
  end

  def train_siege
    if can_train_siege?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      SiegeEngine.new
    else
      nil
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    else
      nil
    end
  end

  def damage(amount)
    raise TypeError unless amount.is_a?(Fixnum)
    @health_points -= amount
  end

  def destroyed?
    health_points <= 0
  end
end
