class Fundamentals
  def self.sigma(int)
    if !int.is_a?(Integer)
      return false
    end
    sum = 0
    for i in 0..int
      sum += i
    end
    return sum
  end

  def self.factorial int
    if !int.is_a?(Integer)
      return false
    end

    fact = 1
    for i in 1..int
      fact *= i
    end
    return fact
  end

  def self.threesAndFives start, stop
    if !start.is_a?(Integer) or !stop.is_a?(Integer)
      return false
    end
    sum = 0
    for i in start..stop
      if (i % 3 == 0 or i % 5 == 0) and !(i % 3 == 0 and i % 5 == 0)
        sum += i
      end
    end
    puts sum
  end

  def self.coinChange(cents)
    if !cents.is_a?(Integer)
      return false
    end
    quarters = dimes = nickels = pennies = 0

    while cents > 25
      quarters += 1
      cents -= 25
    end

    while cents > 10
      dimes += 1
      cents -= 10
    end

    while cents > 5
      nickels += 1
      cents -= 5
    end

    pennies = cents

    puts "Quarters: #{quarters}, Dimes: #{dimes}, Nickles: #{nickels}, Pennies: #{pennies}"

  end

  def self.statisticsToDoubles
    num_rolls = 0
    sum = 0.0
    min = nil
    max = nil

    begin
      die1 = 1 + rand(6)
      die2 = 1 + rand(6)

      puts die1
      puts die2


      if min then
        if die1 < min
          min = die1
        end
        if die2 < min
          min = die2
        end
      else
        min = [die1, die2].min
      end

      if max then
        if die1 > max
          max = die1
        end
        if die2 > max
          max = die2
        end
      else
        max = [die1, die2].max
      end

      sum += die1 + die2
      num_rolls+= 2
    end while die1 != die2

    puts "Min: #{min}, Max: #{max}, Num Rolls: #{num_rolls}, Avg: #{sum/num_rolls}"
  end

  def self.sumToOne(int)
    sum = 0
    while int > 0
      sum += int%10
      int /= 10
    end
    puts sum
  end

  def self.fib int
    if int == 0 || int == 1
      return int
    end

    return fib(int - 1) + fib(int - 2)
  end

  def self.lastDigitAtoB(a, b)
    product = a ** b
    puts product%10
  end
end

Fundamentals.lastDigitAtoB(12, 5)