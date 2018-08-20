# https://codereview.stackexchange.com/questions/85534/frog-jumping-algorithm
# https://medium.com/@sichangpark/codility-2-2-arrays-cyclicrotation-cfcd55c6b17f
# https://rameshere.wordpress.com/2015/08/12/c-codility-frog-jump-program-solution/

# start_x = 10, finish_y = 85, distance_d = 30
def solution(start_x, finish_y, distance_d)
  left_to_hop = finish_y - start_x
  return (left_to_hop / distance_d)
end
# test
# solution(10, 85, 30)

# Example test:    (10, 85, 30)
# WRONG ANSWER  (got 2 expected 3)
# Detected some errors.



# answer
# start_x = 10, finish_y = 85, distance_d = 30
def solution(start_x, finish_y, distance_d)
  left_to_hop = finish_y - start_x
  # ceil bc, cant hop a half space
  return (left_to_hop.to_f / distance_d).ceil
end

# solution(10, 85, 30)
