class Player
  def play_turn(warrior)
    # add your code here
    unless warrior.feel.empty? 
      warrior.attack!
    else
      if warrior.health < 20
        warrior.rest!
      else
        warrior.walk!
      end
    end
  end
end
