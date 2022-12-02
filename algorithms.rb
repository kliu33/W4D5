#Phase 1
def my_min(arr)
    arr.each do |num1|
        arr.each do |num2|
            break if num1 > num2
        end
        return num1
    end
end


#Phase 2
# def my_min(arr)
#     smallest = 0
#     arr.each do |num1|
#         smallest = num1 if num1 < smallest
#     end
#     smallest
# end

p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

