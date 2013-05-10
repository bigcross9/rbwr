require 'actions.rb'

class Player
  def initialize()
	@a = Actions.new()
  end
  def play_turn(warrior)
    # add your code here
	@a.act(warrior)
  end
end
