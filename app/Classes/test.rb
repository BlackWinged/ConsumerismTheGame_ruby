

def solution(n)
  if n == 0
    return 1
  end


  stringArray = n.to_s.split('')
  stringArray.sort!.reverse!
  compareString = stringArray.join('')
  finalResult = 0
  orderOfMagnitude = stringArray.count - 1

  #Since the task emphasizes correctness, this is the most robust, but also the most inefficient solution
  #The text of the task points out that N is limited to five digits, which can be solved sufficiently quickly
  ((10 ** orderOfMagnitude)..stringArray.join('').to_i ).each do |i|
    if compareString == i.to_s.split('').sort.reverse.join('')
      finalResult += 1
    end
  end

  return finalResult
end


