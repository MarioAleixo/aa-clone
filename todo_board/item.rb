require 'date'

class Item
    attr_reader :deadline, :done
    attr_accessor :title, :description

    def initialize(title, deadline, description)
        raise 'deadline is not valid' if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
    end

    def self.valid_date?(date_string)
        !!(/\A\d{4}-\d{2}-\d{2}\Z/.match?(date_string) && Date.strptime(date_string, '%Y-%m-%d'))
    end

    def deadline=(deadline)
        raise 'deadline is not valid' if Item.valid_date?(deadline)
        @deadline = deadline
    end

    def toggle
        @done = !@done
    end
end