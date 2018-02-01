def heapsort(array)
  size = array.length - 1
  sort_array = array

  (size / 2).downto(0) do |index|
    heapify(sort_array, index, size)
  end

  while size > 0
    sort_array[0], sort_array[size] = sort_array[size], sort_array[0]
    size -= 1
    heapify(sort_array, 0, size)
  end
  return sort_array
end


def heapify(array, parent, size)
  root = array[parent]
  while (child = 2 * parent) <= size do
    child += 1 if child < size && array[child] < array[child + 1]
    break if root >= array[child]
    array[parent], parent = array[child], child
  end
  array[parent] = root
end

array = [9, 21, 10, 4, 76, 100]

puts heapsort(array)

require 'benchmark'

puts "The heap sort speed is:"
puts Benchmark.measure {
  heapsort(array)
}
