# problem 6

def digit_sum(number)
  sum = sum_number(number.to_i)
  while sum > 9
    sum = sum_number(sum)
  end
  sum
end

def sum_number(number)
  sum = 0

  while number > 0
    sum += number % 10
    number /=  10
  end
  sum
end

puts "Please insert a string:"
input = gets.chomp

puts digit_sum(input)
