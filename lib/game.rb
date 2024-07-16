class Game
  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
  end

  def draw_board
    @board.each_with_index do |row, idx|
      print_row(row)
      puts '---+---+---' unless idx == @board.length - 1
    end
  end

  private

  def print_row(row)
    row.each_with_index do |token, idx|
      col_separator = idx == row.length - 1 ? "\n" : '|'
      print " #{token} #{col_separator}"
    end
  end

end
