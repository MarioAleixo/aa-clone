require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class Game
    def initialize(n=3, player_marks={})
        @board = Board.new(n)
        @players = player_marks.map do |mark, type|
            type ? @players << ComputerPlayer.new(mark) : @players << HumanPlayer.new(mark)
        end
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            p @board
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
            if @board.win?(@current_player.mark)
                p "Victory to #{@current_player.mark}"
                return
            else
                self.switch_turn
            end
        end
        p 'Draw'
    end
end