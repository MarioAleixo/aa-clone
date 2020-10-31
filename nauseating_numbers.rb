require 'prime'

def strange_sums(arr)
    i = 0
    (0..arr.length - 1).each do |idx1|
        (0..arr.length - 1).each do |idx2|
            if idx2 > idx1 && arr[idx1] + arr[idx2] == 0
                i += 1
            end
        end 
    end
    i
end

def pair_product(nums, prod)
    (0..nums.length - 1).each do |idx1|
        (0..nums.length - 1).each do |idx2|
            if idx2 > idx1 && nums[idx1] * nums[idx2] == prod
                return true
            end
        end 
    end
    false
end

def rampant_repeats(str, hash)
    new_str= ""
    str.split("").map do |char|
        if hash.has_key?(char)
            new_str << char * hash[char]
        else
            new_str << char
        end
    end
    new_str
end

def perfect_square?(square)
    (1..square).any? { |num| num * num == square }
end

def anti_prime?(num)
    def divisors(factor)
        (1...factor).select { |divisor| factor % divisor == 0 }
    end
    (1...num).all? { |divisor| divisors(num).length > divisors(divisor).length } 
end

def matrix_addition(a, b)
    matrix = Array.new(a.length) { Array.new(a.first.length) {0} }
    matrix.each.with_index { |row, idx1| row.map!.with_index { |ele, idx2| a[idx1][idx2] + b[idx1][idx2] } }
end

def mutual_factors(*nums)
    (1..nums.max).select { |divisor| nums.all? { |num| num % divisor == 0 } }
end

def tribonacci_number(num)
    return 1 if ( 0..2 ).include? num
    return 2 if num == 3
    (tribonacci_number( num - 1 ) + tribonacci_number( num - 2 ) + tribonacci_number( num - 3 ))
end

def matrix_addition_reloaded(*matrices)
    return matrices.first if matrices.length == 1
    if matrices.all? { |matrix| matrix.length == matrices.first.length }
        matrix = Array.new(matrices.first.length) { Array.new(2) {0} }
        matrices.each.with_index do |mat, idx1| 
            mat.each.with_index do |row, idx2|
                row.each.with_index do |ele, idx3|
                    matrix[idx2][idx3] += matrices[idx1][idx2][idx3]
                end
            end
        end
        matrix
    else
        nil
    end
end

def squarocol?(arr)
    arr.any? { |row| row.uniq.size <= 1 } || arr.transpose.any? { |col| col.uniq.size <= 1 }
end

def squaragonal?(arr)
    diags = []
    reverse_diags = []
    arr.each.with_index { |row, idx| diags << row[idx] }
    arr.reverse_each.with_index { |row, idx| reverse_diags << row[idx] }
    diags.uniq.size <= 1 || reverse_diags.uniq.size <= 1
end

def pascals_triangle(levels)
    arr = Array.new(levels) { Array.new }

    arr.each.with_index do |row, n|
        (0..n).each do |k|
            if n - k <= 0
                row << 1
            elsif k <= 0
                row << 1
            else
                row << arr[n - 1][k - 1] + arr[n - 1][k]
            end
        end 
    end
    arr
end

def mersenne_prime(n)
    primes = []
    pow = 0
    while primes.length != n do
        num = (2 ** pow) - 1
        primes << num if Prime.prime?(num)
        pow += 1
    end
    return primes.last
end

def triangular_word?(word)
    alpha = ('a'..'z').to_a
    sum = (word.split("").map { |char| alpha.find_index(char) + 1 }).reduce(:+)
    (1..sum).any? { |i| (i * (i + 1)) / 2 == sum }
end

def consecutive_collapse(arr)
    idx = 0
    while idx + 1 < arr.length
        if arr[idx] - arr[idx + 1] == -1 || arr[idx] - arr[idx + 1] == 1
            arr.slice!(idx..(idx + 1))
            idx = 0
        else
            idx += 1
        end
    end
    arr
end

def pretentious_primes(arr, n)
    arr.map do |ele|
        if n < 0 
            primes = (2...ele).select { |num| Prime.prime?(num) }
            primes[n] if primes.length >= n.abs
        else
            primes = []
            i = ele + 1
            while primes.length < n 
                primes << i if Prime.prime?(i)
                i += 1
            end
            primes.last
        end
    end
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0
p '------'

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false
p '------'

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'
p '------'

p perfect_square?(1)     # true
p perfect_square?(4)     # true
p perfect_square?(64)    # true
p perfect_square?(100)   # true
p perfect_square?(169)   # true
p perfect_square?(2)     # false
p perfect_square?(40)    # false
p perfect_square?(32)    # false
p perfect_square?(50)    # false
p '------'

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false
p '------'

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]
p '------'

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]
p '------'

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274
p '------'

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
p '------'

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false
p '------'

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false
p '------'

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]
p '------'

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071
p '------'

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false
p '------'

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []
p '------'

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
p '------'