
cache = {} -- this is just a table declaration


function woop(cache)
	cache["yeet"] = "output"
	cache[2] = "yeezy"    --tables in lua can store indexes of numbers and keys
end

woop(cache)
print(cache["yeet"])
print(cache[2])    --tables in lua are essentially hash tables

