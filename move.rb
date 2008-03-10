#fixme (can score yahtzees >1)
class Move
  def initialize(move_type)
    @move_type = move_type
  end

  def make(dice)
    raise "Already made this move" if @score
    @score = send(@move_type, dice)
  end

  attr_reader :score

  private

    def ones(dice)
      sum_for(1, dice)
    end

    def twos(dice)
      sum_for(2, dice)
    end

    def threes(dice)
      sum_for(3, dice)
    end

    def fours(dice)
      sum_for(4, dice)
    end

    def fives(dice)
      sum_for(5, dice)
    end

    def sixes(dice)
      sum_for(6, dice)
    end

    def full_house(dice)
      dice.sort!
      dice.uniq.length == 2 && (dice[0] == dice[1]) && (dice[-1] == dice[-2]) ? 25 : 0
    end

    def small_straight(dice) 
      sorted_dice = dice.uniq.sort
      sorted_dice[0..3] == [1, 2, 3, 4] || sorted_dice[0..3] == [2, 3, 4, 5] || sorted_dice[1..4]== [3, 4, 5, 6] ? 30 : 0
    end

    def large_straight(dice)
      dice.sort!
      dice == [1, 2, 3, 4, 5] || dice == [2, 3, 4, 5, 6] ? 40 : 0
    end

    def three_of_a_kind(dice)
      dice.reject{|d| d != dice.sort[2]}.length >= 3 ? dice.inject() {|sum, val| sum + val} : 0
    end

    def four_of_a_kind(dice)
      dice.reject{|d| d != dice.sort[2]}.length >= 4 ? dice.inject() {|sum, val| sum + val} : 0
    end

    def yahtzee(dice)
      dice == Array.new(5, dice[0]) ? 50 : 0
    end

    def chance(dice)
      dice.inject() {|sum, val| sum + val}
    end

    def sum_for(dice_value, dice)
      dice.select{|d| d == dice_value}.inject(0) {|sum, val| sum + val}
    end
end
