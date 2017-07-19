# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
    last_index_nums1 = m - 1
    last_index_nums2 = n - 1
    last_index_merged = m + n - 1

    last_index_merged.downto(0) do |i|
        current_nums1 = nums1[last_index_nums1]
        current_nums2 = nums2[last_index_nums2]

        if last_index_nums1 == -1
            nums1[i] = current_nums2
            last_index_nums2 -= 1
            next
        elsif last_index_nums2 == -1
            nums1[i] = current_nums1
            last_index_nums1 -= 1
            next
        end

        if current_nums1 <= current_nums2
            nums1[i] = current_nums2
            last_index_nums2 -= 1
        else
            nums1[i] = current_nums1
            last_index_nums1 -= 1
        end
    end
end
