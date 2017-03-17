class SinglyLinkedList
  require '../LinkedList/node'
  attr_reader :head

  def initialize
    @head = nil
  end


  def addFront(val)
    newNode = Node.new(val, @head)
    @head = newNode
  end

  def removeFront()
    temp = @head
    @head = @head.next
    temp.next = nil
    return temp.val
  end

  def contains(val)
    if @head.nil?
      return false
    end

    current = head
    while !current.nil?
      if current.val == val
        return true
      else
        current = current.next
      end
    end
    return false
  end

  def length
    length = 0
    current = @head
    while !current.nil?
      length += 1
      current = current.next
    end
    return length
  end

  def average
    sum = 0.0
    length = 0
    current = @head
    while !current.nil?
      length += 1
      sum += current.val
      current = current.next
    end
    return sum/length
  end

  def min
    if @head.nil?
      return false
    end
    min = nil
    current = @head
    while !current.nil?
      if min.nil?
        min = current.val
      elsif min > current.val
        min = current.val
      end
      current = current.next
    end
    return min
  end

  def max
    if @head.nil?
      return false
    end
    max = nil
    current = @head
    while !current.nil?
      if max.nil?
        max = current.val
      elsif max < current.val
        max = current.val
      end
      current = current.next
    end
    return max
  end

  def display
    str = ""
    current = @head
    while !current.nil?
      str += current.val.to_s + ", "
      puts current.val.to_s
      current = current.next
    end
    return str[0...str.size-2]
  end

  def reverse
    if length <= 1
      return
    end

    currNode = @head
    prevNode = nil
    nextNode = nil
    begin
      nextNode = currNode.next;
      currNode.next = prevNode;
      prevNode = currNode;
      currNode = nextNode;
    end while !currNode.nil?;
    @head = prevNode;

    return self
  end

  def is_Palindrome?
    str = display
    reverse = self.clone.reverse.display

    return str == reverse
  end

  def kthLast(k)
    count = length - k
    if count < 0
      return false
    end
    current = @head
    while count > 1
      current = current.next
      count-= 1;
    end
    return current.val
  end

  def setupListLoop(loopStartPos)
    if loopStartPos > length
      return false
    end

    current = @head
    while !current.next.nil?
      current = current.next
    end
    tail = current
    current = @head
    while loopStartPos != 1
      current = current.next
      loopStartPos -= 1
    end
    tail.next = current
  end

  def containsLoop?
    turtle = hare = @head
    while !hare.nil? and !hare.next.nil?
      turtle = turtle.next
      hare = hare.next.next
      if turtle == hare
        return true
      end
    end
    return false
  end

  def startOfLoop
    turtle = hare = @head
    while !hare.nil? and !hare.next.nil?
      turtle = turtle.next
      hare = hare.next.next
      if turtle == hare
        flag = @head
        while flag != turtle
          flag = flag.next
          turtle = turtle.next
        end
        return flag
      end
    end
    return false
  end

  def endOfLoop
    turtle = hare = @head
    while !hare.nil? and !hare.next.nil?
      turtle = turtle.next
      hare = hare.next.next
      if turtle == hare
        flag = @head
        count = 1
        while flag != turtle
          flag = flag.next
          turtle = turtle.next
          count +=1
        end
        for _ in 1...count
          flag = flag.next
        end
        return flag
      end
    end
    return false
  end

  def breakLoop
    if self.containsLoop?
      tail = self.endOfLoop
      tail.next = nil
    else
      return false
    end
  end

  def numNodes
    turtle = hare = @head
    count = 0
    while !hare.nil? and !hare.next.nil?
      turtle = turtle.next
      count += 1
      hare = hare.next.next
      if turtle == hare
        flag = @head
        while flag != turtle
          count += 1
          flag = flag.next
          turtle = turtle.next
        end
        return count
      end
    end
    while !turtle.nil?
      count += 1
      turtle = turtle.next
    end
    return count
  end

  def rotateList(n)
    #n = n mod length
    #remove back and add to front n times
  end

  def rListLength
    count = 0
    if @head.nil?
      return count
    else
      count += 1
      return rLength(@head.next, count)
    end
  end

  private

  def rLength(node, count)
    if node.nil?
      return count
    else
      count += 1
      return rLength(node.next, count)
    end
  end

end

def sumListNumberals(list1, list2)
  leftSum = rightSum = 0
  leftCurrent = list1.head
  rightCurrent = list2.head

  while !leftCurrent.nil?
    leftSum *= 10
    leftSum += leftCurrent.val
    leftCurrent = leftCurrent.next
  end
  while !rightCurrent.nil?
    rightSum *= 10
    rightSum += rightCurrent.val
    rightCurrent = rightCurrent.next
  end

  return leftSum + rightSum
end

sll = SinglyLinkedList.new
sll.addFront(1)
sll.addFront(2)
sll.addFront(3)
sll.addFront(4)
sll.addFront(5)
sll.addFront(5)
sll.addFront(5)
sll.addFront(5)

# sll.setupListLoop(3)
puts sll.rListLength
# puts sll.display
