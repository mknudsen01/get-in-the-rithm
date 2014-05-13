BRACKET_MAPPING = {
  '{' => '}',
  '[' => ']',
  '(' => ')'
}
def validate_brackets input
  openers = BRACKET_MAPPING.keys
  closers = BRACKET_MAPPING.values

  bracketsStack = [];
  characters = input.split(' ');
  characters.each do  |character|
    bracketsStack.push(character) if openers.include? character
    if closers.include? character
      last_character = bracketsStack.pop()
      return false if BRACKET_MAPPING[last_character] != character
    end
  end

  return bracketsStack.empty?


end

def assert_equals actual, expected
  p actual == expected
end

assert_equals(validate_brackets("{ [ ] ( ) }"), true)
assert_equals(validate_brackets("{ [ ( ] ) }"), false)
assert_equals(validate_brackets("{ [ }" ), false)
assert_equals(validate_brackets("{ [ ( ] ) }" ), false)