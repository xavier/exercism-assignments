class CircularBuffer

  class Error < StandardError        ; end
  class BufferEmptyException < Error ; end
  class BufferFullException  < Error ; end

  def initialize(buffer_size)
    @buffer = [nil] * buffer_size
    @head   = 0
    @count  = 0
  end

  def clear
    @count = 0
  end

  def read
    raise BufferEmptyException if empty?
    data = @buffer[@head]
    advance_head!
    @count -= 1
    data
  end

  def write(data)
    return if data.nil?
    raise BufferFullException if full?
    @buffer[tail] = data
    @count += 1
  end

  def write!(data)
    @buffer[@head] = data
    advance_head!
  end

  protected

  def empty?
    @count.zero?
  end

  def full?
    @count == size
  end

  def size
    @buffer.size
  end

  def advance_head!
    @head = advance(@head)
  end

  def tail
    advance(@head, @count)
  end

  def advance(pointer, n=1)
    (pointer + n) % size
  end

end