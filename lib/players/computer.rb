module Players
  class Computer < Player

def move(arr)
  realism_timer = rand(1..5)
  choice = rand(1..9)
  sleep realism_timer.to_i
  return choice.to_s
end


end
end
