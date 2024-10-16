def fizzbuzz(n)
  (1..n).map do |num|
    case
    when (num % 15).zero? then 'FizzBuzz'
    when (num % 3).zero? then 'Fizz'
    when (num % 5).zero? then 'Buzz'
    else num
    end
  end
end

puts fizzbuzz(100)
