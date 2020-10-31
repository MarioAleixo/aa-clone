def partition(arr, num)
    lt = []
    gt = []
    arr.map do |ele|
        lt << ele if ele < num
        gt << ele if ele >= num
    end
    [lt, gt]
end

def merge(h1, h2)
    h1.merge(h2)
end

def censor(str, cw)
    vowels = "aeiou"
    words = str.split
    words.each do |word|
        if cw.map(&:downcase).include? word.downcase
            word.downcase.each_char.with_index { |char, idx| word[idx] = "*" if vowels.include? char }
        end
    end
    words.join(" ")
end

def power_of_two?(num)
    num.to_s(2).count('1') == 1
end