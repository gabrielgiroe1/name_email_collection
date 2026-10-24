# problem 3

def replace_numbers(number)
  result = []

  number.split.each do |value|
    if is_number?(value)
      result << "NUMBER"
    else
      result << value
    end
  end
  result.join(" ")
end

  def is_number?(string)
    true if Float(string) rescue false
  end

puts "Please insert a string:"
input = gets.chomp

puts replace_numbers(input)
