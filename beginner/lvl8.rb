class Player
  attr_reader :health, :rescue

  def initialize
    @health ||= 20
    @rescue ||= false
  end

  def under_attack?(warrior)
    @health > warrior.health
  end

  def health_low?(warrior)
    @health < 15
  end

  def retreat?(warrior)
    @health < 12
  end

  def rescued?(warrior)
    @rescue == true
  end

  def empty_ahead?(warrior)
    warrior.feel.empty?
  end

  def empty_far_ahead?(warrior)
    spaces = warrior.look
    spaces.map! do |space|
      space.empty?
    end
    if spaces.include?(false)
      return false
    else
      return true
    end
  end

    def stairs_ahead?(warrior)
      spaces = warrior.look
      spaces.map! do |space|
        space.stairs?
      end
      if spaces.include?(true)
        return true
      else
        return false
      end
    end

  def play_turn(warrior)
    # set variables
    initialize

    if !rescued?(warrior) && empty_ahead?(warrior)
      warrior.walk!
    elsif !rescued?(warrior)
      warrior.rescue!
      @rescue = true
    elsif empty_far_ahead?(warrior)
      warrior.walk!
    elsif !empty_far_ahead?(warrior)
      if stairs_ahead?(warrior)
        warrior.walk!
      else
        warrior.shoot!
      end
    end
    @health = warrior.health
  end
end
