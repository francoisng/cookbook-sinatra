class Recipe
  attr_accessor :name, :description, :prep_time, :marked_as_done, :difficulty

  def initialize(name, description)
    @name = name
    @description = description
    @prep_time = prep_time
    @difficulty = difficulty
    @marked_as_done = false
  end

  def mark_as_done!
    @marked_as_done = true
  end

  def done?
    @marked_as_done
  end

  def set_difficulty(difficulty)
    @difficulty = difficulty
  end

end
