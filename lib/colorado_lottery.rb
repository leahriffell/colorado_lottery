class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  
  def initialize
    @registered_contestants = Hash.new {|h, k| h[k] = []}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.game_interests.include?(game.name) && contestant.age >= 18
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && (!contestant.out_of_state? || game.national_drawing?)
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      @registered_contestants[game.name] << contestant
    end
  end

  def eligible_contestants(game)
    #instructions differ from interaction pattern (instructions call for moeny > cost but pattern says >= cost)
    @registered_contestants[game.name].select do |contestant|
      contestant.spending_money >= game.cost 
    end
  end
end