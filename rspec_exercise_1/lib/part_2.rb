def hipsterfy(word)
    vowels = "aeiou"
    chars = word.split("")
    chars.reverse.each_with_index do |char, idx|
        if vowels.include?(char)
            chars.delete_at(-idx - 1)
            return chars.join("")
        end
    end
    return chars.join("")
end

def vowel_counts(str)
    vowels = "aeiou"
    hash = Hash.new(0)
    str.downcase.split("").each { |char| hash[char] += 1 if vowels.include?(char) }
    hash
end

def caesar_cipher(str, num)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""
    str.split("").each do |char|
        if alpha.include?(char)
            new_str << alpha[(alpha.index(char) + num) % 26] 
        else
            new_str << char
        end
    end
    new_str
end