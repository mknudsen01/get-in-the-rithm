# given an input string and the location of an opening
# parenthesis, finds the location of the closing parenthesis
def find_closing_parenthesis input, open_location
  # input_length = input.length
  # chopped_input = input[open_location..input_length]
  parentheses_count = 0
  position = 0
  input.each_char do |character|
    if (character != "(" && character != ")")
      position += 1
      next
    elsif character == "("
      parentheses_count += 1
    elsif character == ")"
      parentheses_count -= 1
      return position if parentheses_count == 0
    end
    position += 1
  end
end

def assert_equals actual, expected
  p actual == expected
end

sentence = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
sentence2 = "( this should (())()be equal to 34), given 0"

assert_equals(find_closing_parenthesis(sentence, 10), 79)
assert_equals(find_closing_parenthesis(sentence2, 0), 34)