# incomplete

class Player

  def play_turn(warrior)
    # set variables
    initialize

    # rescue the captive
    if @rescue == false
      if warrior.feel(:backward).empty? == true
        warrior.walk!(:backward)
      else
         warrior.rescue!(:backward)
        @rescue = true
      end
    # if under attack and health is low, move backward
    elsif @health > warrior.health && warrior.health < 7
      if warrior.feel(:backward).empty?
        warrior.walk!(:backward)
      end
    # if enemy in front, attack
    elsif warrior.feel.empty? == false
      warrior.attack!
    # if health is low, rest
    elsif @health < 8 && warrior.feel.empty?
      warrior.rest!
    # if no enemy in front, walk
    elsif warrior.feel.empty?
      warrior.walk!
    end
    @health = warrior.health
  end

  def initialize
    @health ||= 20
    @rescue ||= false
  end
end
