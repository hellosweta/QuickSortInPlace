class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    # partition_idx = QuickSort.partition(array, 0, array.length)
    # # array[0], array[partition_idx] = array[partition_idx], array[0]
    # left = array[0...partition_idx]
    # right = array[partition_idx + 1..-1]
    # QuickSort(array, 0, left.length) + [array[partition_idx]] + QuickSort(array, partition_idx + 1, right.length)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { | el1, el2 | el1 <=> el2 }
    return array if length <= 1
    partition_idx = QuickSort.partition(array, start, length, &prc)
    array[start], array[partition_idx] = array[partition_idx], array[start]
    QuickSort.sort2!(array, 0, (partition_idx - start))
    QuickSort.sort2!(array, (partition_idx + 1), (length - partition_idx - 1))
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { | el1, el2 | el1 <=> el2 }
    pivot_idx = start
    i = pivot_idx + 1
    partition_idx = pivot_idx
    while i < start + length
      if prc.call(array[pivot_idx], array[i]) == 1
        if i > partition_idx
          array[i], array[partition_idx + 1] = array[partition_idx + 1], array[i]
        end
        partition_idx += 1
      end
      i += 1
    end
    partition_idx
  end
end
