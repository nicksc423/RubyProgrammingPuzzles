class Basic13

  #for loop
  for i in 1..255
    p i;
  end

  #sum
  sum = 0;
  for i in 1..255
    sum += i
  end
  print sum

  arr = [1,2,3,4,5,6,7,8,9]
  p arr.min
  p arr.max

  arr = []
  for i in 1..255
    if i.odd?
      arr << i
    end
  end
  p arr

  def self.greaterThanY(arr, y)
    if !arr.is_a?(Array) || !y.is_a?(Integer)
      return false
    end
    count = 0
    for i in 0...arr.size
      if arr[i] > y
        count += 1
      end
    end
    puts count
  end

  def self.minMaxAverage(arr)
    if !arr.is_a?(Array)
      return false
    end

    avg = arr.inject(0){|sum,x| sum + x } / arr.size
    puts arr.min
    puts arr.max
    puts avg
  end

  def self.swapNegativeValues(arr, val)
    if !arr.is_a?(Array)
      return false
    end
    for i in 0...arr.size
      if arr[i] < 0
        arr[i] = val
      end
    end
    return arr
  end

  def self.shiftArray(arr)
    arr.shift
    return arr
  end
end

Basic13.greaterThanY([1,2,3,4,5], 3)
Basic13.minMaxAverage [1,2,3]
puts Basic13.swapNegativeValues [1,2,3,-1], 'test'

puts Basic13.shiftArray [1,2,3]