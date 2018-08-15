
function fibMemo(n,cache)
	if cache[n] ~= nil then
		return cache[n]
	end

	if n == 1 or n == 0 then
		return n
	elseif n > 1 then
		value = fibMemo(n-1,cache) + fibMemo(n-2,cache)
	end

	cache[n] = value
	return value
end

--calling the fib function
print('Enter an index to find its corresponding fibonacci number')
cache = {}
count = 0
repeat
	value = fibMemo(count,cache)
	print ("Fib("..count.."): " ..value)
	count = count + 1
until count == 1000
