class Recursion
  def self.rSigma(val)
    if !val.is_a?(Numeric)
      return false
    end

    val = val.floor
    if(val <= 0)
      return 0
    elsif(val == 1)
      return 1
    else
      return rSigma(val-1)+val
    end
  end

  def self.binaryStringExpansion(str)
    return stringExpand(str, [])
  end

  def self.stringExpand(str, arr)
    for i in 0...str.size
      if str[i] == '?'
        temp1 = str.dup
        temp2 = str.dup
        temp1[i] = '1'
        temp2[i] = '0'
        stringExpand(temp1, arr)
        stringExpand(temp2, arr)
        break
      end
      if i == str.size-1
        arr << str
      end
    end
    return arr
  end

  def self.inOrderSubsets(str)
    if str.empty?
      return []
    end

    head = str[0]
    if str.size == 1
      return [head]
    end

    tail = str[1...str.size]

    ps = Array.new
    ps << head

    tailSubsets = inOrderSubsets(tail)
    tailsSubsetsWithCurrentHeadPrepended = tailSubsets.dup.map! { |string| head + string }
    ps.concat(tailSubsets)
    ps.concat(tailsSubsetsWithCurrentHeadPrepended)

    return ps
  end

  def self.rFactorial(val)
    val = val.floor
    if val <= 0
      return 1
    end

    return val * rFactorial(val-1)
  end

  def self.stringPermutations(str)
    return findPermutations("", str, [])
  end

  def self.findPermutations(prefix, suffix, arr)
    if suffix.empty?
      arr << prefix
      return arr
    end
    for i in 0...suffix.size
      copy = suffix.dup
      newChar = copy.slice!(i)
      arr = findAnagrams(prefix+newChar, copy, arr)
    end
    return arr
  end

  def self.stringCombinations(str)
    return findCombinations("", str, [])
  end

  def self.findCombinations(prefix, suffix, arr)
    if suffix.empty?
      return arr
    end
    for i in 0...suffix.size
      copy = suffix.dup
      newChar = copy.slice!(i)
      arr << prefix + newChar
      arr = findCombinations(prefix+newChar, copy, arr)
    end
    return arr
  end

end

var = "c"
# puts var.slice!(0)
# puts var
puts Recursion.stringCombinations("abc")