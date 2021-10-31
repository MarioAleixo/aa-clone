require './item.rb'

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >= 0 && index < self.size
    end

    def swap(index_1, index_2)
        return false if [index_1, index_2].any? { |index| !self.valid_index?(index) }
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        valid_index?(index) ? @items[index] : nil
    end

    def priority
        @items.first
    end
    
    def print
        puts "-------------------------------------------------"
        puts "                #{@label.upcase}"
        puts "-------------------------------------------------"
        puts "Index | Item                 | Deadline   | Done" 
        puts "-------------------------------------------------"
        @items.each.with_index do |item, idx|
            puts "#{idx.to_s.ljust(6)}| #{item.title.ljust(21)}| #{item.deadline} | #{item.done ? '[✓]' : '[ ]' }"
        end
        puts "-------------------------------------------------"
    end

    def print_full_item(index)
        if self.valid_index?(index)
            puts "-------------------------------------------------"
            puts "#{@items[index].title.ljust(32)}#{@items[index].deadline.ljust(14)}#{@items[index].done ? '[✓]' : '[ ]' }"
            puts "#{@items[index].description}"
            puts "-------------------------------------------------"
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount=1)
        return false if !self.valid_index?(index)
        index.downto(index-amount+1) { |idx| self.swap(idx, idx - 1) if idx != 0 }
        true
    end

    def down(index, amount=1)
        return false if !self.valid_index?(index)
        index.upto(index+amount-1) { |idx| self.swap(idx, idx + 1) if idx != self.size }
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !self.valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        @items.filter! { |item| !item.done }
    end
end