def doubler(start)
  puts start
  doubler(start * 2) if start < 10
end

# doubler(3)

# fibonacci
def fib(times_to_fib)
  if times_to_fib < 2
    times_to_fib
  else
    fib(times_to_fib - 1) + fib(times_to_fib - 2)
  end
end

# puts fib(10)


# [recursion in ruby](https://www.leighhalliday.com/recursion-in-ruby)
# [recursion in elixir](https://www.leighhalliday.com/recursion-in-elixir)
# [ruby recursion with memo](http://www.rubyguides.com/2015/08/ruby-recursion-and-memoization/)
