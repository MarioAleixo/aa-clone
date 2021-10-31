class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Player #{@mark}, enter two numbers representing a position in the format `row col`"
        input = gets.chomp
        if /\A\d+ \d+\Z/.match?(input)
            input.split(" ").map(&:to_i)
        else 
            raise "sorry, that was invalid :("
        end
    end
end