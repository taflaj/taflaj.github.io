# montecarlo.jl

is_inside(x ::Float64, y ::Float64) = x*x + y*y <= 1.0

function calculate(iterations ::Int)
    inside = 1
    for i in 1:iterations
        if is_inside(rand(), rand())
            inside += 1
        end
    end
    return inside * 4.0 / iterations
end

print(calculate(100_000_000))
