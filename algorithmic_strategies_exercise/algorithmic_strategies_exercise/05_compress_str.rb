# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    hash = Hash.new(0)
    string = ""
    str.split("").each { |char| hash[char] += 1 }
    hash.each do |k, v|
        if v == 1
            string << k
        else
            string << v.to_s + k
        end
    end
    string
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
