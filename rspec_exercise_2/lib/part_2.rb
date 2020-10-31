def palindrome?(str)
    rev_str = ""
    str.each_char { |char| rev_str.prepend(char) }
    return true if str == rev_str
    return false if str != rev_str
end

def substrings(str)
    arr = []
    str.each_char.with_index do |char1, idx1|
        arr << char1
        str.each_char.with_index do |char2, idx2|
            if  idx2 > idx1
                arr << str[idx1..idx2]
            end
        end
    end
    arr
end

def palindrome_substrings(str)
    substrings(str).filter { |sub| sub.length > 1 && palindrome?(sub) }
end