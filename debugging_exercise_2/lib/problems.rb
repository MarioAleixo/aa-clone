# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)

    def prime?(num)
        return false if num < 2
    
        (2...num).each do |factor|
            if num % factor == 0
                return false
            end
        end
        true
    end

    ((2..num).filter { |divisor| prime?(divisor) && num % divisor == 0 }).max
end

def unique_chars?(str)
    str.each_char { |char| return false if str.count(char) > 1 }
    true
end

def dupe_indices(arr)
    dupes = Hash.new { |h,k| h[k] = [] }
    arr.each.with_index { |char, idx| dupes[char] << idx if arr.count(char) > 1 }
    dupes
end

def ana_array(arr1, arr2)
    def arr_hash(arr)
        hash = Hash.new(0)
        arr.each.with_index { |char, idx| hash[char] += 1 }
        hash
    end
    arr_hash(arr1) == arr_hash(arr2)
end