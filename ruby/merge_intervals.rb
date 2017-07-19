# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
    hash_table = intervals.reduce({}) do |h, interval|
        max_end = h[interval.start]

        if max_end.nil?
            h[interval.start] = interval.end
        else
            h[interval.start] = interval.end if interval.end > max_end
        end

        h
    end

    hash_table.keys.sort.reduce([]) do |arr, start_int|
        end_int = hash_table[start_int]

        if arr.empty?
            arr << Interval.new(start_int, end_int)
        else
            if arr.last.end >= start_int
                arr.last.end = end_int if arr.last.end < end_int
            else
                arr << Interval.new(start_int, end_int)
            end
        end

        arr
    end
end
