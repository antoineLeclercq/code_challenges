# @param {Integer} n
# @return {String}
def count_and_say(n)
    return "1" if n == 1

    current_sequence = "1"
    counter = 2

    while counter <= n
        next_sequence = ""
        nums = current_sequence.chars.map(&:to_i)

        index = 0
        while index < nums.size
            current_num = nums[index]
            counter_num = 1

            while nums[index + 1] == current_num
                index += 1
                counter_num += 1
            end

            next_sequence << (counter_num.to_s + current_num.to_s)

            index += 1
        end

        current_sequence = next_sequence

        counter += 1
    end

    next_sequence
end
