class Die
  def initialize
    roll
  end

  def roll
    @number = rand(6) + 1
  end

  def to_s
    @number
  end

  attr_reader :number
end
