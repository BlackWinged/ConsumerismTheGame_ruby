class PlayGround

  def solution(a, k)
    for i in 0..k
      b = a.last
      a.insert(0,b)
      a.pop
    end
    a
  end

end
