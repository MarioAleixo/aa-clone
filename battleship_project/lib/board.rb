class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  attr_reader :size

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, val)
    @grid[position[0]][position[1]] = val
  end

  def num_ships
    count = 0
    
    (0...@grid.length).each do |row| 
      (0...@grid.length).each do |col| 
        count += 1 if self[[row, col]] == :S
      end
    end
    
    count
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p 'you sunk my battleship!'
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    until self.num_ships == @size * 0.25
      self[[rand(@grid.length - 1), rand(@grid.length - 1)]] = :S
    end
  end

  def hidden_ships_grid
    hidden_grid = []

    (0...@grid.length).each do |row|
      hidden_grid[row] = [] 
      (0...@grid.length).each do |col| 
        if self[[row, col]] == :S
          hidden_grid[row] << :N
        else
          hidden_grid[row] << self[[row, col]]
        end
      end
    end
    hidden_grid
  end

  def self.print_grid(grid)
    grid.each { |row| puts row.join(' ') }
  end

  def cheat
    Board.print_grid(@grid)
  end
    
  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
