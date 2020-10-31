def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    tlds = ['.com', '.net', '.io', '.org']
    urls.none? { |url| tlds.include?(url[url.index('.')..-1]) }
end

def any_passing_students?(students)
    students.any? { |student| (student[:grades].sum/student[:grades].length * 1.0) >= 75 }
end