class Barracks < Unit
  attr_reader :gold, :food, :lumber
  def initialize
    @gold = 1000
    @food = 80
    @lumber = 500
    super(500, 0)
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
    end
  end

  def train_siege
    if can_train_siege?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      SiegeEngine.new
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

end
