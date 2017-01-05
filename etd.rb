require "byebug"

def my_min_slow(array)
  smallest = array.first

  array.each do |num|
    array.each do |other_num|
      smallest = num if num < other_num && num < smallest
    end
  end

  smallest
end

def my_min_fast(array)
  smallest = array.first

  array.each do |num|
    smallest = num if num < smallest
  end

  smallest
end

# def contig_subsum(array)
#   return [array.first] if array.length <= 1
#   arrays = []
#
#   arrays[0] << contig_subsum(array[1..-1])
#
# end

def contig_subsum(array)
  sub_arrays = []
  i = 0
  j = 0
  while i < array.length do
    while j < array.length do
      sub_arrays << array[i..j]
      j += 1
    end
    i += 1
    j = i
  end

  max_sum = 0
  arr = []

  sub_arrays.each do |sub|
    arr << sub.inject(:+)
  end

  arr.uniq.sort.last

end

def contig_subsums_fast(array)
  largest_sum = array.first
  current_sum = array.first

  array.drop(1).each do |num|
    current_sum = 0 if current_sum < 0
    current_sum += num
    largest_sum = current_sum if current_sum > largest_sum
  end

  largest_sum
end


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_slow(list)

list = [2, 3, -6, 7, -6, 7]
p contig_subsums_fast(list)
