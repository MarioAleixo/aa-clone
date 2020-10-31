def zip(*arr)
    new_arr = Array.new(arr[0].length) { Array.new }
    arr.each { |sub| (0...sub.length).each { |idx| new_arr[idx] << sub[idx] } }
    new_arr
end

def prizz_proc(arr, prc1, prc2)
    arr.select { |ele| [prc1.call(ele), prc2.call(ele)].one? }
end

def zany_zip(*arr)
    longest = arr.max_by { |x| x.length }.length
    new_arr = Array.new(longest) { Array.new }
    arr.each { |sub| (0...longest).each do |idx|
        if sub[idx]
            new_arr[idx] << sub[idx]
        else
            new_arr[idx] << nil
        end
    end
    }
    new_arr
end

def maximum(arr, &prc)
    return nil if arr.empty?
    max = 0
    max_val = 0
    arr.each do |ele|
        if prc.call(ele) >= max_val
            max = ele
            max_val = prc.call(ele)
        end
    end
    max
end

def my_group_by(arr, &prc)
    hash = Hash.new { |h, k| h[k] = [] }
    arr.each { |ele| hash[prc.call(ele)] << ele }
    hash
end

def max_tie_breaker(arr, proc, &prc)
    return nil if arr.empty?
    max = 0
    max_val = 0
    arr.each do |ele|
        if prc.call(ele) > max_val
            max = ele
            max_val = prc.call(ele)
        elsif prc.call(ele) == max_val
            if proc.call(ele) > max_val
                max = ele 
                max_val = proc.call(ele)
            end
        end
    end
    max
end

def silly_syllables(str)
    new_str = str.split.map do |word| 
        if word.count("aeiou") >= 2
            word[word.index(/[aeiou]/)..word.rindex(/[aeiou]/)]
        else
            word
        end
    end
    new_str.join(" ")
end