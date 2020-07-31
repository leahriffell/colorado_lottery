class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  
  def initialize
    @registered_contestants = Hash.new {|h, k| h[k] = []}
    @winners = []
    @current_contestants = Hash.new {|h, k| h[k] = []}
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

  def charge_contestants(game)
    eligible_contestants(game).each do |contestant|
      contestant.charge(game.cost)
      @current_contestants[game] << contestant.full_name
    end
  end

  #  current_contestants are lists of contestant names who have been charged, organized by game.
end