class Arrays
  # arr = [1,2,3,4,5,6]
  # arr.unshift 0
  # puts arr
  # arr.shift
  # puts arr
  # arr.insert(3, 3.5)
  # puts arr
  # arr.delete_at(3)
  # puts arr

  def self.manualReverse(arr)
    for i in 0..arr.size/2
      arr[i], arr[arr.size-1-i] = arr[arr.size-1-i], arr[i]
    end
    puts arr
  end

  def self.skylineHeights(arr)
    sights = []
    max = 0
    for i in 0...arr.size
      if arr[i] > max
        max = arr[i]
        sights << arr[i]
      end
    end
    return sights
  end

  def self.binarySearch(arr, val)
    if !arr or arr.size == 0
      return false
    end
    start = 0
    stop = arr.size-1

    while start <= stop
      mid = stop + ((start-stop)/2)
      if arr[mid] == val
        return true
      elsif arr[mid] < val
        start = mid+1
      else
        stop = mid-1
      end
    end

    return false

  end

  def self.recursiveBinarySearch(arr, val)
    if !arr
      return false
    end

    if arr.size == 1
      if arr[0] == val
        return true
      else
        return false
      end
    end

    mid = arr.size / 2

    if val > arr[mid]
      return recursiveBinarySearch arr[mid+1..arr.size], val
    elsif val < arr[mid]
      return recursiveBinarySearch arr[0..mid-1], val
    else
      return true
    end
  end

  def self.rotateArray(arr, shiftBy)
    shiftBy = shiftBy % arr.size

    for i in 1..shiftBy
      arr.unshift(arr.pop)
    end

    puts arr
  end

  def self.rotateArrayLeft(arr, shiftBy)
    shiftBy = shiftBy % arr.size

    for i in 1..shiftBy
      arr << arr.shift
    end

    puts arr
  end

  def self.balancePoint(arr)
    sumRight = 0
    for i in 0...arr.size
      sumRight += arr[i]
    end
    sumLeft = 0
    for i in 0...arr.size
      sumLeft += arr[i]
      sumRight -= arr[i]

      if sumRight == sumLeft
        return true
      end
    end

    return false
  end

  def self.balanceIndex(arr)
    sumRight = 0
    for i in 0...arr.size
      sumRight += arr[i]
    end
    sumLeft = 0
    for i in 0...arr.size
      sumRight -= arr[i]
      if sumRight == sumLeft
        return i
      end
      sumLeft += arr[i]
    end

    return false
  end

  def self.flatten(arr)
    if arr.nil? or !arr.is_a?(Array)
      return false
    end

    for i in arr
      if i.is_a?(Array)
        temp = flatten(i)
        for j in temp
          arr << j
        end
        arr.delete(i)
      else
        temp = i
        arr.delete(i)
        arr << i
      end
    end
  end

  def self.removeDupes(arr)
    for i in 0...arr.size
      for j in i+1...arr.size
        if arr[i] == arr[j]
          arr.delete_at(j)
        end
      end
    end
  end

  def self.removeDupes2(arr)
    arr.sort!

    for i in 0...arr.size-1
      if arr[i] == arr[i+1]
        arr.delete_at(i)
      end
    end
  end

  def self.findMode(arr)
    arr.sort!
    count = 0
    max = 0
    mode = nil
    for i in 0...arr.size-1
      if arr[i] == arr[i+1]
        count += 1
        if count > max
          mode = arr[i]
        end
      else
        count = 0
      end
    end
  return mode
  end

  def self.medianOfTwoArrays(arr1, arr2)
    for i in arr2
      arr1 << i
    end

    arr1.sort!

    if arr1.size.odd?
      puts "odd"
      return arr1[arr1.size/2]
    else
      puts "even?"
      return ((arr1[arr1.size/2]+arr1[(arr1.size-1)/2]).to_f/2)
    end
  end

  def self.medianOfNArrays(arr1, *arrN)
    for i in arrN
      for j in i
        arr1 << j
      end
    end

    arr1.sort!


    if arr1.size.odd?
      puts "odd"
      return arr1[arr1.size/2]
    else
      puts "even?"
      return ((arr1[arr1.size/2]+arr1[(arr1.size-1)/2]).to_f/2)
    end
  end

end

arr1 = [1,5,9]
arr2 = [1,2,3,4,5]
arr3 = [1,2,6,10]

[1,1,1,2,2,3,4,5,5,6,9,10]
puts Arrays.medianOfNArrays(arr1, arr2, arr3)


