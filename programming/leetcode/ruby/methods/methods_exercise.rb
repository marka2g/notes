gets()
# EASY

# Write a method that returns the least common multiple of its two arguments.
# You may use the lcm method.
def my_lcm(int_one, int_two)
  int_one.lcm(int_two)
end

# Write a method that returns its argument converted to a float then
# converted to a string.
def to_stringified_float(int)
  int.to_f.to_s
end

# Write a method that returns the sum of the absolute values of its arguments.
def absolute_sum(num_one, num_two)
  num_one.abs + num_two.abs
end

# Write a method that returns the negative value of its argument.
# If the argument is negative, the method simply returns the argument.
# (negative(-1) => -1, negative(1) => -1, negative(0) => 0)
# HINT: use the abs method
def negative(num)
  -(num.abs)
end


# MEDIUM

# Write a method that returns the last digit of its argument.
# Assume the argument is an integer.
# HINT: What is the return value of 142 % 10? How about 2 % 10?
def last_digit(int)
  int % 10
end

# Write a method that returns a boolean indicating whether
# the last digit of the method's argument is odd.
# Assume the argument is an integer.
# Bonus points if you use last_digit as a helper method.
def last_digit_odd?(int)
  last_digit(int).odd?
end

# Write a method that returns the greatest common divisor of the last
# digit of each of its arguments. Assume the arguments are integers.
# (gcd_of_last_digits(93, 9) = 3.gcd(9) => 3)
# Bonus points if you use last_digit as a helper method.
def gcd_of_last_digits(int_one, int_two)
  int_one.gcd(int_two)
end

# Write a method that returns the last n digits of its first argument,
# where n is the second argument.
# Assume both arguments are non-zero integers.
# (last_n_digits(1234, 2) => 34)
# HINT: What is the return value of 1234 % 100? How about 4 % 100?
def last_n_digits(num, n)
  num % (10 ** n)
end


#HARD

# Write a method that returns the decimal remainder of dividing two floats.
# The decimal remainder is the right side of the decimal point
# (the "fractional part") of the quotient.
# (dec_remainder_of_two_floats(8.0, 5.0) => 0.6 because 8.0 / 5.0 => 1.6)
def dec_remainder_of_two_floats(f_dividend, f_divisor)
  ##nope (f_dividend / f_divisor).to_s.split('.')
  ##nope (f_dividend / f_divisor) % 10
  # mine yep but cheating a bit
  # "0.#{(f_dividend / f_divisor).to_s.split('.')[1]}".to_f

  # their solution doesn't even fukn work.  lol! LAME!
  # f_quotient = f_dividend / f_divisor
  # f_quotient - f_quotient.floor # 1.6 - 1 => 0.6

  # lemmy fix that for u d1p $h`75
  f_quotient = f_dividend / f_divisor
  (f_quotient - f_quotient.floor).round(2) # 1.6 - 1 => 0.6
end

# Write a method that returns the decimal remainder of dividing two integers.
# HINT: Use dec_remainder_of_two_floats as a helper method,
# but don't forget to pass the proper type of argument
def dec_remainder_of_two_integers(i_dividend, i_divisor)
  dec_remainder_of_two_floats(i_dividend.to_f, i_divisor.to_f)
end

# their solutions
# HARD
# Subsequent comments walk through the code as if the methods were invoked
# with 8.0 and 5.0 or 8 and 5 as arguments.
def dec_remainder_of_two_floats(f_dividend, f_divisor)
  f_quotient = f_dividend / f_divisor # 1.6 (8.0 / 5.0)
  f_quotient - f_quotient.floor # 1.6 - 1 => 0.6
end

def dec_remainder_of_two_integers(i_dividend, i_divisor)
  f_dividend = i_dividend.to_f # 8.0
  f_divisor = i_divisor.to_f # 5.0
  dec_remainder_of_two_floats(f_dividend, f_divisor) # => 0.6
end


# EXPERT

def int_remainder_without_modulo(i_dividend, i_divisor)
 d_remainder = dec_remainder_of_two_integers(i_dividend, i_divisor) # 0.6
 f_remainder = d_remainder * i_divisor # 3.0 (0.6 * 5)
 f_remainder.round # => 3
end


# TESTING SUITE BELOW: DO NOT MODIFY

$success_count = 0
$failure_count = 0

def deep_dup(arr)
  arr.inject([]) { |acc, el| el.is_a?(Array) ? acc << deep_dup(el) : acc << el }
end

def note_success(returned, invocation, expectation)
  puts "success: #{invocation} => #{expectation}"
  $success_count += 1
end

def note_failure(returned, invocation, expectation)
  puts "failure: #{invocation}: expected #{expectation}, returned #{returned}"
  $failure_count += 1
end

def format_args(args)
  o_args = deep_dup(args)
  o_args.map! do |arg|
    prettify(arg)
  end
  o_args.join(', ')
end

def prettify(statement)
  case statement
  when Float
    statement.round(5)
  when String
    "\"#{statement}\""
  when NilClass
    "nil"
  else
    statement
  end
end

def equality_test(returned, invocation, expectation)
  if returned == expectation && returned.class == expectation.class
    note_success(returned, invocation, expectation)
  else
    note_failure(returned, invocation, expectation)
  end
end

def identity_test(returned, invocation, expectation, args)
  if returned.__id__ == args[0].__id__
    equality_test(returned, invocation, expectation)
  else
    puts "failure: #{invocation}: You did not mutate the original array!"
    $failure_count += 1
  end
end

def method_missing(method_name, *args)
  method_name = method_name.to_s
  expectation = args[-1]
  args = args[0...-1]
  if method_name.start_with?("test_")
    tested_method = method_name[5..-1]
    print_test(tested_method, args, expectation)
  else
    method_name = method_name.to_sym
    super
  end
end

def print_test(method_name, args, expectation)
  returned = self.send(method_name, *args)
  returned = prettify(returned)
  expectation = prettify(expectation)
  args_statement = format_args(args)
  invocation = "#{method_name}(#{args_statement})"
  method_name.include?("!") ? identity_test(returned, invocation, expectation, args) : equality_test(returned, invocation, expectation)
  rescue Exception => e
    puts "failure: #{invocation} threw #{e}"
    puts e.backtrace.select {|t| !t.include?("method_missing") && !t.include?("print_test")}
    $failure_count += 1
end

puts "\nmy_lcm:\n" + "*" * 15 + "\n"
test_my_lcm(9, 3, 9)
test_my_lcm(4, 6, 12)
puts "\nto_stringified_float:\n" + "*" * 15 + "\n"
test_to_stringified_float(2, "2.0")
test_to_stringified_float(0, "0.0")
puts "\nabsolute_sum:\n" + "*" * 15 + "\n"
test_absolute_sum(2, -2, 4)
test_absolute_sum(2, 2, 4)
puts "\nnegative:\n" + "*" * 15 + "\n"
test_negative(-1, -1)
test_negative(0, 0)
puts "\nlast_digit:\n" + "*" * 15 + "\n"
test_last_digit(1234, 4)
test_last_digit(0, 0)
puts "\nlast_digit_odd?:\n" + "*" * 15 + "\n"
test_last_digit_odd?(1234, false)
test_last_digit_odd?(1233, true)
puts "\ngcd_of_last_digits:\n" + "*" * 15 + "\n"
test_gcd_of_last_digits(93, 9, 3)
test_gcd_of_last_digits(42, 44, 2)
puts "\nlast_n_digits:\n" + "*" * 15 + "\n"
test_last_n_digits(1234, 2, 34)
test_last_n_digits(1234, 1, 4)
puts "\ndec_remainder_of_two_floats:\n" + "*" * 15 + "\n"
test_dec_remainder_of_two_floats(8.0, 5.0, 0.6)
test_dec_remainder_of_two_floats(10.0, 4.0, 0.5)
puts "\ndec_remainder_of_two_integers:\n" + "*" * 15 + "\n"
test_dec_remainder_of_two_integers(8, 5, 0.6)
test_dec_remainder_of_two_integers(10, 4, 0.5)
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0
