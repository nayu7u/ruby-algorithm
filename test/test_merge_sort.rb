# typed: ignore

require "minitest/autorun"
require "merge_sort"

class TestMergeSort < Minitest::Test
  def test_sort
    array = [5, 4, 3, 2, 1]
    sorted = MergeSort.new.sort(array)

    assert_equal(array.sort, sorted)
  end

  def test_split
    merge_sort_obj = MergeSort.new
    merge_sort_obj.instance_eval do
      def temp_split(arg)
        split(arg)
      end
    end

    array = [5, 4, 3, 2, 1]
    splited = merge_sort_obj.temp_split(array)

    assert_equal([[5, 4], [3, 2, 1]], splited)
  end
end
