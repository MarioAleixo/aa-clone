def is_prime?(num)
    return false if num < 2
    (2...num).none? { |factor| num % factor == 0 }
end

def nth_prime(n)
    i = 0
    primes = []
    until primes.length == n do
        i += 1
        primes << i if is_prime?(i)
    end
    primes[-1]
end

def prime_range(min, max)
    primes = []
    (min..max).each { |num| primes << num if is_prime?(num)}
    primes
end