class Queue
  require '../LinkedList/node'

  attr_reader :front, :back

  def initialize
    @front = nil
    @back = nil
  end

  def enqueue(val)
    newNode = Node.new(val, nil)
    if @front.nil?
      @front = newNode
      @back = newNode
      return
    end

    current = @front
    while !current.next.nil?
      current = current.next
    end
    current.next = newNode
    @back = newNode
  end

  def dequeue(val)
    holder = @head
    @head = @head.next

    holder.next = nil
    return holder.val
  end

  def size
    size = 0
    current = @head
    while !current.nil?
      size += 1
      current = current.next
    end
    return size
  end

  def is_empty?
    if @front.nil?
      return true
    else
      return false
    end
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
end