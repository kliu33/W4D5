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

# list = [2,3,-6,7,-6,7]
# p better_version(list)



#Anagrams

#Phase1

def first_anagram(str1, str2)
    chars1 = str1.split("")
    chars2 = str2.split("")
    anagrams = chars1.permutation(str1.length).to_a
    anagrams.each do |anagram|
        return true if anagram == chars2
    end
    false
end


#Phase 2

def second_anagram(str1, str2)
    chars1 = str1.split("")
    chars2 = str2.split("")
    chars1.each do |char|
        if chars2.include?(char)
            chars2.delete_at(chars2.find_index(char))
        else
            return false
        end
    end
    return true if chars2.empty?
end


#Phase 3




#Phase 4 O(n)

# def fourth_anagram(str1, str2)
#     count1 = Hash.new(0)
#     count2 = Hash.new(0)

#     str1.each_char do |char|
#         count1[char] += 1
#     end

#     str2.each_char do |char|
#         count2[char] += 1
#     end

#     count1.sort == count2.sort
# end

#or

def fourth_anagram(str1, str2)
    count = Hash.new(0)

    str1.each_char do |char|
        count[char] += 1
    end

    str2.each_char do |char|
        count[char] -= 1
    end

    count.none? {|k,v| v != 0 }
end



p second_anagram("gizmo", "sally")    #=> false
p second_anagram("elvis", "lives")    #=> true