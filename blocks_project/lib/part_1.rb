def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(array)
    array.count { |arr| arr.sum > 0 }
end

def aba_translate(str)
    vowels = "aeiou"
    chars = str.split("")
    (chars.each.with_index { |char, i| chars.insert(i + 1, "b" + char).join("") if vowels.include?(char) }).join("")
end

def aba_array(array)
    array.map { |word| aba_translate(word) }
end