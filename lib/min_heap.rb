class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def add(key, value = key)
    new_heap_node = HeapNode.new(key, value)
    @store.append(new_heap_node)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def remove()
    swap(0, @store.length - 1)
    result = @store.pop
    heap_down(0) unless @store.empty?
    return result.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(n)
  # Space complexity: O(1)
  def empty?
    return true if @store == []
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_up(index)
    parent_index = find_parent_index(index)
    while @store[index].key < @store[parent_index].key && parent_index >= 0
      swap(parent_index, index)
      index = parent_index
      parent_index = find_parent_index(index)
    end
  end

  def find_parent_index(child_index)
    if child_index % 2 == 0
      parent_index = (child_index - 2) / 2
    else
      parent_index = (child_index - 1) / 2
    end
    return parent_index
  end

  # This helper method takes an index and
  #  moves it down the heap if it's bigger
  #  than it's child's node.
   # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_down(index)
    child_index = find_minimum_child_index(index)
    while child_index <= @store.length - 1 && @store[index].key > @store[child_index].key
      swap(index, child_index)
      index = child_index
      child_index = find_minimum_child_index(index)
    end
  end

  def find_minimum_child_index(index)
    child_index1 = 2 * index + 1
    child_index2 = 2 * index + 2
    return child_index1 if child_index1 > @store.length - 1
    if @store[child_index1].key <= @store[child_index2].key
      min_child_index = child_index1
    else
      min_child_index = child_index2
    end
    return min_child_index
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
