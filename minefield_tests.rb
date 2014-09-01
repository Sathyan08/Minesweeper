class Minefield
  attr_reader :row_count, :column_count

  def initialize(row_count, column_count, mine_count)
    @column_count = column_count
    @row_count = row_count
    @mine_count = mine_count

    @minefield_rep = []

    @row_count.times do
      @minefield_row = []
        @column_count.times do
          @minefield_row << 0
        end

         @minefield_rep << @minefield_row
    end

    @coordinate_list = []

    until @minefield_rep.to_s.scan("Mine").count == @mine_count
      x_coordinate = rand(@column_count)
      y_coordinate = rand(@row_count)

      @minefield_rep[y_coordinate][x_coordinate] = "Mine"
      @coordinates = []

      @coordinates << x_coordinate
      @coordinates << y_coordinate

      @coordinate_list << @coordinates
    end
  end

  def minefield_rep
    @minefield_rep
  end
end

  #   @adjacents_collection = adjacents_collection(@coordinate_list[0], @minefield_rep)
  # end

  #   def adjacents_collection(coordinate, minefield_rep)

  #     row = coordinate[0]
  #     column = coordinate[1]

  #     @adjacent_column = []

  #     if row - 1 >= 0
  #       @adjacent_column << (row - 1)
  #     end

  #     if row  <= @row_count
  #       @adjacent_column << (row + 1)
  #     end

  #     @adjacent_row = []

  #     if column - 1 >= 0
  #       @adjacent_row << (column - 1)
  #     end

  #     if column <= @row_count
  #       @adjacent_row << column + 1
  #     end

  #   end

  #   def adjacent_column
  #     @adjacent_column
  #   end

  #   def adjacent_row
  #     @adjacent_row
  #   end

      # x_coordinate_adjacents = [(x_coordinate - 1), (x_coordinate), (x_coordinate + 1)]
      # y_coordinate_adjacents = [(y_coordinate -1), (y_coordinate), (y_coordinate + 1)]

      # y_coordinate_adjacents.each do |y_coordinate_adjacent|
      #   x_coordinate_adjacents.each do |x_coordinate_adjacent|
      #     if @minefield_rep[x_coordinate_adjacent][y_coordinate_adjacent].fetch != nil && @minefield_rep[x_coordinate_adjacent][y_coordinate_adjacent].class == Integer
      #       @minefield_rep[x_coordinate_adjacent][y_coordinate_adjacent] += 1
      #     end
      #   end
      # end


    # end

    # @minefield_rep.each do |row|
    #   row.each do |space|
    #     if space == :empty_space
    #       adjacent_mines = 0
    #       if row



#   def coordinate_list
#     @coordinate_list
#   end



#   def mine_count
#     @mine_count
#   end
# end

minefield_1 = Minefield.new(20,20,50)

minefield_1.minefield_rep.each do |row|
  puts row.to_s
  puts
end

# puts "coordinates"
# puts
# puts

# minefield_1.coordinate_list.each do |coordinate|
#   puts coordinate.to_s
#   puts
# end

# puts "Adjacent Columns:"

# puts minefield_1.adjacent_column

# p "Adajcent Rows"

# puts minefield_1.adjacent_row

