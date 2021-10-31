class ComputerPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        position = legal_positions.sample
        puts "Computer #{@mark} chose position #{position}"
        position
    end
end
