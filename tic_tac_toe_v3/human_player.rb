class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        puts "Player #{@mark}, enter two numbers representing a position in the format `row col`"
        input = gets.chomp
        if /\A\d+ \d+\Z/.match?(input)
            position = input.split(" ").map(&:to_i)
            if !legal_positions.include?(position)
                puts "#{position} is not a legal position"
                self.get_position(legal_positions)
            else
                position
            end
        else 
            raise "sorry, that was invalid :("
        end
    end
end