# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
    return 1 if n == 0

    if n < 0
        n = -n
        x = 1 / x
    end

    n.even? ? my_pow(x * x, n / 2) : x * my_pow(x * x, n / 2)
end
