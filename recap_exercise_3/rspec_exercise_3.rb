## GENERAL PROBLEMS ##

def no_dupes?(arr)
    arr.select { |ele| arr.count(ele) == 1 }
end

def no_consecutive_repeats?(arr)
    (0..arr.length - 1).each do |idx|
        return false if arr[idx] == arr[idx + 1]
    end
    true
end

def char_indices(str)
    indices = Hash.new { |h, v| h[v] = [] }
    str.each_char.with_index { |char, idx| indices[char] << idx }
    indices
end

def longest_streak(str)
    long_char = ""
    count = 0
    str.split("").uniq.each do |char|
        if str.count(char) >= count
            long_char = char
            count = str.count(char)
        end
    end
    long_char * count
end

def bi_prime?(num)
    def is_prime?(num)
        (2...num).none? { |factor| num % factor == 0} 
    end
    
    (2...num).select { |factor| is_prime?(factor) }.each do |num1|
        (2...num).select { |factor| is_prime?(factor) }.each do |num2|
            return true if num1 * num2 == num
        end
    end
    false
end

def vigenere_cipher(str, key)
    new_str = ""
    alpha = ("a".."z").to_a.join("")
    str.each_char do |char|
        new_str << alpha[(alpha.index(char) + key[str.index(char) % key.length]) % 26]
    end
    new_str
end

def vowel_rotate(str)
    new_str = ""
    index = 0
    vows = str.split("").select { |char| "aeiou".include?(char) }
    rotated = vows.rotate(-1)
    str.each_char do |char|
        if "aeiou".include?(char)
            new_str << rotated[index]
            index += 1
        else
            new_str << char
        end
    end
    new_str
end

## PROC PROBLEMS ##

class String
    def select(&prc)
        new_str = ""
        self.each_char { |char| new_str << char if prc.call(char)} if prc
        new_str
    end

    def map!(&prc)
        self.each_char.with_index { |char, idx| self[idx] = prc.call(char, idx)}
    end
end

## RECURSION PROBLEMS ##

def multiply(a, b)
    return a if b == 1
    if b <= 0
        a - multiply(a, b.abs + 1)
    else
        a + multiply(a, b.abs - 1) 
    end
end

def lucas_sequence(length)
    if length == 0
        []
    elsif length == 1
        [2]
    elsif length == 2
        [2, 1]
    else
        lucas_sequence(length - 1) << lucas_sequence(length - 1)[-1] + lucas_sequence(length - 1)[-2]
    end
end

def prime_factorization(num)
    def is_prime?(num)
        (2...num).none? { |factor| num % factor == 0} 
    end
    
    (2...num).select { |factor| is_prime?(factor) }.each do |num1|
        while num % num1 == 0
            return [*num1, *prime_factorization(num / num1)]
        end
    end
    [num]
end


p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
p '-----'

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
p '-----'

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
p '-----'

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
p '-----'

p bi_prime?(14)   # => true   
p bi_prime?(22)   # => true   
p bi_prime?(25)   # => true   
p bi_prime?(94)   # => true   
p bi_prime?(24)   # => false  
p bi_prime?(64)   # => false
p '-----'

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
p '-----'

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
p '-----'

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
p '-----'

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"
p '-----'

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
p '-----'

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
p '-----'

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
p '-----'