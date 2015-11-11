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
    @health < 11
  end

  def retreat?(warrior)
    @health < 6
  end

  def rescued?(warrior)
    @rescue == true
  end

  def play_turn(warrior)
    # set variables
    initialize

    if warrior.feel.wall?
      warrior.pivot!

    # rescue the captive
    # if !rescued?(warrior)
    #   if warrior.feel(:backward).empty? == true
    #     warrior.walk!(:backward)
    #   else
    #      warrior.rescue!(:backward)
    #      @rescue = true
    #   end
    # if under attack and health is low, move backward
    elsif under_attack?(warrior) && retreat?(warrior)
      if warrior.feel(:backward).empty?
        warrior.walk!(:backward)
      end
    # if health is low, rest
    elsif health_low?(warrior) && warrior.feel.empty?
      warrior.rest!
    # if no enemy in front, walk
    elsif warrior.feel.empty?
      warrior.walk!
    elsif !warrior.feel.empty?
      warrior.attack!
    end
    @health = warrior.health
  end
end
