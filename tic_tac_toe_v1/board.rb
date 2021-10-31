class Board
    def initialize(n=3)
        @grid = Array.new(n) { Array.new(n) {'_'} }
    end

    def valid?(position)
        position.all? { |coord| coord >= 0 && coord < @grid.length }
    end

    def empty?(position)
        @grid[position[0]][position[1]] == '_'
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            @grid[position[0]][position[1]] = mark
        else
            raise "invalid mark"
        end
    end

    def print
        @grid.each { |row| p row }
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |row| row.all?(mark) }
    end

    def win_diagonal?(mark)
        left_diagonal = (0..@grid.size - 1).collect { |i| @grid[i][i] }
        right_diagonal = (0..@grid.size - 1).collect { |i| @grid.map(&:reverse)[i][i] }
        left_diagonal.all?(mark) || right_diagonal.all?(mark)
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? { |row| row.include?('_') }
    end
end