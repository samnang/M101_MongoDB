obj = {a: 1, b: 2, c: [1, 3, 5]}

sum = 0
sum = obj[:c].reduce(:+) if obj.has_key?(:c)

puts sum
