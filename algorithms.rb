#Phase 1

require 'byebug'

def my_min(arr)  #O(n^2)
    smallest = arr[0]
    (0...arr.length).each do |idx|
        (idx+1...arr.length).each do |jdx|
            smallest = arr[jdx] if smallest > arr[jdx]
        end
    end
    smallest
end


#Phase 2 
def my_min2(arr) #O(n)
    smallest = 0
    arr.each do |num1|
        smallest = num1 if num1 < smallest
    end
    smallest
end

# p my_min([0, 3, 5, 4, -5, 10, 1, 90])
# p my_min2([0, 3, 5, 4, -5, 10, 1, 90])



#Phase 1 Sub-sum

def largest_contiguous_subsum(list)
    sums = []
    subarr = []
    (0...list.length).each do |idx|
        (idx...list.length).each do |jdx|
            subarr << list[idx..jdx]
        end
    end
    subarr.each do |el|
        sums << el.sum 
    end
    sums.max
end

def better_version(list)
    largest_sum = 0
    curr_sum = 0
    list.each do |ele|
        curr_sum += ele
        largest_sum = curr_sum if curr_sum > largest_sum
        curr_sum = 0 if 0 > curr_sum
    end
    largest_sum
end

list = [2,3,-6,7,-6,7]
p better_version(list)

