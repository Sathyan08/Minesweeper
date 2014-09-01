class Minefield
  attr_reader :row_count, :column_count

  def initialize(row_count, column_count, mine_count)
    @column_count = column_count
    @row_count = row_count

    @mine_count = mine_count

    @minefield_rep = []

    @cleared_spaces = []
    @mines_detonated = []

    @row_count.times do
      @minefield_row = []
        @column_count.times do
          @minefield_row << 0
        end

         @minefield_rep << @minefield_row
    end


    until @minefield_rep.to_s.scan("Mine").count == @mine_count
      x_coordinate = rand(@column_count)
      y_coordinate = rand(@row_count)

      @minefield_rep[y_coordinate][x_coordinate] = "Mine"
    end

      @clear_space_counter = 0

    @minefield_rep.each do |row|
      row.each do |space|
        if space == 0
          @clear_space_counter += 1
        end
      end
    end
  end

  # Return true if the cell been uncovered, false otherwise.
  def cell_cleared?(row, col)
    @cleared_spaces.each do |cleared_space|
      if cleared_space[0] == row && cleared_space[1]== col
        return true
      end
    end

    false
  end

  # Uncover the given cell. If there are no adjacent mines to this cell
  # it should also clear any adjacent cells as well. This is the action
  # when the player clicks on the cell.
  def clear(row, col)

    if row >= 0 && row < (@row_count) && col >= 0  && col < (@column_count) && cell_cleared?(row,col) == false

      if contains_mine?(row, col) == true
        @mines_detonated << [row,col]
      else
        @cleared_spaces << [row,col]
      end

      if adjacent_mines(row,col) == 0

        # if cell_cleared?(row + 1, col) == false
          clear(row +1, col)
        # end

        # if cell_cleared?(row - 1,col) == false
          clear(row -1, col)
        # end

        # if cell_cleared?(row, col + 1)== false
          clear(row, col + 1)
        # end

        # if cell_cleared?(row, col - 1) == false
          clear(row, col - 1)
        # end
      end
    end
  end

  # Check if any cells have been uncovered that also contained a mine. This is
  # the condition used to see if the player has lost the game.
  def any_mines_detonated?
    if @mines_detonated.length > 0
      return true
    end

    false
  end

  # Check if all cells that don't have mines have been uncovered. This is the
  # condition used to see if the player has won the game.
  def all_cells_cleared?

    if @cleared_spaces.length == @clear_space_counter
      return true
    end

    false
  end

  # Returns the number of mines that are surrounding this cell (maximum of 8).
  def adjacent_mines(row, col)
    @adjacent_mines = 0

    if (row + 1) < @row_count && (col + 1) < @column_count
      if @minefield_rep[row + 1][col + 1] == "Mine"
        @adjacent_mines += 1
      end
    end

    if (col + 1) < @column_count
      if @minefield_rep[row][col + 1] == "Mine"
        @adjacent_mines += 1
      end
    end

    if (row - 1) >= 0 && (col + 1) < @column_count
      if @minefield_rep[row -1][col + 1] == "Mine"
        @adjacent_mines += 1
      end
    end

    if (row + 1) < @row_count
      if @minefield_rep[row + 1][col] == "Mine"
        @adjacent_mines += 1
      end
    end

    if (row - 1) >= 0
      if @minefield_rep[row-1][col] == "Mine"
        @adjacent_mines += 1
      end
    end

    if (row + 1) < @row_count && (col - 1) >= 0
      if @minefield_rep[row + 1][col -1] == "Mine"
        @adjacent_mines += 1
      end
    end

    if (col - 1) >= 0
      if @minefield_rep[row][col - 1] == "Mine" && (col - 1) >=0
        @adjacent_mines += 1
      end
    end

    if (row - 1) >= 0 && (col - 1) >= 0
      if @minefield_rep[row - 1][col - 1] == "Mine" && (col - 1) >=0 && (row -1) >= 0
        @adjacent_mines += 1
      end
    end
    @adjacent_mines
  end

  # Returns true if the given cell contains a mine, false otherwise.
  def contains_mine?(row, col)
    if @minefield_rep[row] != nil
      if @minefield_rep[row][col] == "Mine"
        return true
      end
    end

    false
  end

  def minefield_rep
    @minefield_rep
  end

  def clear_space_counter
    @clear_space_counter
  end

  def cleared_spaces
    @cleared_spaces.sort
  end

end

minefield_1 = Minefield.new(20,20,50)

minefield_1.clear(0,0)


p minefield_1.cleared_spaces

p minefield_1.cleared_spaces.length

p minefield_1.clear_space_counter
