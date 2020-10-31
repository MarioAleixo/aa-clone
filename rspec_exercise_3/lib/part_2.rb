def element_count(arr)
    counts = Hash.new(0)
    arr.each { |ele| counts[ele] += 1 }
    counts
end

def char_replace!(str, hash)
    str.each_char.with_index { |char, idx| str[idx] = hash[char] if hash.has_key?(char) }
    str
end

def product_inject(arr)
    arr.inject(:*)
end