# typed: strict
require "sorbet-runtime"

# merge sort
class MergeSort
  extend T::Sig

  # TODO: asc, desc option
  sig { params(array: T::Array[Integer]).returns(T::Array[Integer]) }
  def sort(array)
    merge_sort(*split(array))
  end

  private

  sig { params(left: T::Array[Integer], right: T::Array[Integer]).returns(T::Array[Integer]) }
  def merge_sort(left, right)
    left = merge_sort(*split(left)) if left.size >= 2
    right = merge_sort(*split(right)) if right.size >= 2
    merge(left, right)
  end

  sig { params(array: T::Array[Integer]).returns([T::Array[Integer], T::Array[Integer]])}
  def split(array)
    left = T.must(array[0..(array.size/2)-1])
    right = T.must(array[(array.size/2)..(array.size)])
    [left, right]
  end

  sig { params(left: T::Array[Integer], right: T::Array[Integer]).returns(T::Array[Integer]) }
  def merge(left, right)
    sorted = []
    loop do
      if left.size.zero? && right.size.zero?
        break
      end

      if left.size.positive? && right.size.zero?
        sorted << left.shift
        next
      end

      if left.size.zero? && right.size.positive?
        sorted << right.shift
        next
      end

      if T.must(left[0]) <= T.must(right[0])
        sorted << left.shift
        next
      end

      if T.must(left[0]) > T.must(right[0])
        sorted << right.shift
        next
      end
    end
    sorted
  end
end
