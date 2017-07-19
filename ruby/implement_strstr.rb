# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    return 0 if needle.empty?

    start_index = 0
    found = false

    haystack.chars.each_with_index do |haystack_c, haystack_index|
        start_index = haystack_index

        break if haystack.size - haystack_index < needle.size

        if haystack_c == needle[0]
            needle.chars.each_with_index do |needle_c, needle_index|
                found = false
                break unless needle_c == haystack[haystack_index + needle_index]
                found = true
            end

            return start_index if found
        end
    end

    -1
end
