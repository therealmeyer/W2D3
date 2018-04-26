class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[3,2,1],[],[]]
  end

  def play
      won?
      render
      prompt_user
     valid_move?
      move


    game_over
  end

  def prompt_user
  end

  def won?
  end

  def render
  end

  def valid_move?

  end

  def move(from_tower,to_tower)
    ring = @towers[from_tower].pop
    @towers[to_tower].push(ring)
  end

  def game_over
  end

end
