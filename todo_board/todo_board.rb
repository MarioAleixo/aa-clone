require './list.rb'

class TodoBoard
    def initialize
        @board = Hash.new
    end

    def get_command
        print "\nEnter a command: "
        cmd, label, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @board[label] = List.new(label)
        when 'ls'
            @board.each { |label, list| puts ' ' + label }
        when 'showall'
            @board.each { |label, list| list.print }
        when 'mktodo'
            @board[label].add_item(*args)
        when 'up'
            @board[label].up(*args.map(&:to_i))
        when 'down'
            @board[label].down(*args.map(&:to_i))
        when 'swap'
            @board[label].swap(*args.map(&:to_i))
        when 'sort'
            @board[label].sort_by_date!
        when 'priority'
            @board[label].print_priority
        when 'print'
            args.empty? ? @board[label].print : @board[label].print_full_item(*args.map(&:to_i))
        when 'toggle'
            @board[label].toggle_item(*args.map(&:to_i))
        when 'rm'
            @board[label].remove_item(*args.map(&:to_i))
        when 'purge'
            @board[label].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while get_command; end
    end
end

TodoBoard.new.run