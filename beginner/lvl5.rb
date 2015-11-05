class Player
  def play_turn(warrior)
    if @health == nil
      @health = 20
    end

    if warrior.feel.captive?
      warrior.rescue!
    elsif @health > warrior.health
      if warrior.feel.empty?
        warrior.walk!
      else
        warrior.attack!
      end
    elsif @health < 12 && warrior.feel.empty?
      warrior.rest!
    elsif warrior.feel.empty? == false
      warrior.attack!
    elsif warrior.feel.empty?
      warrior.walk!
    end
    @health = warrior.health
  end
end
  
