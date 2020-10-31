def average(num1, num2)
    (num1 + num2)/2.0
end

def average_array(arr)
    arr.inject { |sum, el| sum + el }.to_f / arr.size
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    words = str.downcase.split
    words.each_with_index do |word, idx|
        if idx % 2 == 0
            words[idx] = word.upcase
        end
    end
    words.join(" ")
end