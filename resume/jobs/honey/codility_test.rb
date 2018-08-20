# task 2
def solution(a)


  a.each do |element|

  end
end
# tests
# solution([2, 4, 1, 6, 5, 9, 7])
# solution([4, 3, 2, 6, 1])
# solution([2, 1, 6, 4, 3, 7])

# task 1
# find bug(s) and modify 1 line of code in the incorrect implementation of a function that is supposed to return the smallest element of the given non-empty array A which containes at most 1000 ints w/in rang (-1000..1000)

def solution(a)
  ans = 0
  for i in 0..(a.length - 1)
    if ans > a[i]
        ans = a[i]
    end
  end
  return ans
end
# test
# solution([-1, 1, -2, 2])


# orig
def solution(a)
  ans = 0
  for i in 1 .. (a.length - 1)
    if ans > a[i]
        ans = a[i]
    end
  end
  return ans
end
# test
# solution([-1, 1, -2, 2])
# solution([-77, -3, -5, -4])
