class Strings
  def self.rotate(str, n)
    n = n % str.size
    start = str.slice!(str.size-n...str.size)
    return start.concat(str)
  end

  def self.is_rotation?(s1, s2)
    bool = s1.size == s2.size and (s2 * 2).include?(s1)
    return bool
  end

  def self.censor(str, arr)
    for i in arr
      str.gsub!(i, "x" * i.size)
    end
    return str
  end

  def self.is_permutation?(s1, s2)
    characters = Hash.new
    s1.split('').each do |i|
      if characters.has_key?(i)
        characters[i] = characters[i] + 1
      else
        characters[i] = 1
      end
    end
    s2.split('').each do |i|
      if characters.has_key?(i)
        if characters[i] == 0
          return false
        else
          characters[i] = characters[i] -1
        end
      else
        return false
      end
    end
    for val in characters.values
      if val != 0
        return false
      end
    end
    return true
  end

  def self.is_panagram?(str)
    alphabet = ('a'..'z').to_a
    str.downcase!
    str.split('').each do |i|
      alphabet.delete(i)
    end

    return alphabet.size == 0
  end

  def self.is_perfect_panagram?(str)
    alphabet = ('a'..'z').to_a
    str.downcase!
    str.split('').each do |i|
      if alphabet.include?(i)
        alphabet.delete(i)
      else
        return false
      end
    end
    return alphabet.size == 0
  end
end

puts Strings.is_perfect_panagram?("abcdefghijklmnopqrstuvwxyz ")