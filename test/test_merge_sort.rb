require "minitest/autorun"
require "merge_sort"

class TestMergeSort < Minitest::Test
  def test_sort
    array = [5,4,3,2,1]
    sorted = MergeSort.new.sort(array)

    assert_equal(array.sort, sorted)
  end
end