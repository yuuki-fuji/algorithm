def fizzbuzz(n)
  (1..n).each do |num|
    puts case
          when (num % 15).zero? then 'FizzBuzz'
          when (num % 3).zero? then 'Fizz'
          when (num % 5).zero? then 'Buzz'
          else num
          end
  end
end

fizzbuzz(100)
