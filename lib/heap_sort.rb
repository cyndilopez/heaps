

# This method uses a heap to sort an array.
# Time Complexity:  O(n logn)
# Space Complexity: O(1)
def heapsort(list)
  n = list.length
  (n / 2).downto(0) do |i|
    heapify(list, i, n)
  end
  n -= 1
  while n > 0
    list[0], list[n] = list[n], list[0]
    n -= 1
    heapify(list, 0, n)
  end
  return list
end

def heapify(array, index, len)
  greatest = index
  left_child = 2 * index + 1
  right_child = 2 * index + 2
  if left_child < len && array[left_child] > array[index]
    greatest = left_child
  end
  if right_child < len && array[right_child] > array[greatest]
    greatest = right_child
  end
  if greatest != index
    swap(array, greatest, index)
    heapify(array, greatest, len)
  end
end

def swap(array, index_1, index_2)
  temp = array[index_1]
  array[index_1] = array[index_2]
  array[index_2] = temp
end
