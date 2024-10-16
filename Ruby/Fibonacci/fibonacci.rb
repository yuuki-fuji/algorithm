def fibonacci_sequence(n)
  a, b = 0, 1
  (0..n).each do |i|
    puts "フィボナッチ(#{i}) = #{a}"
    a, b = b, a + b
  end
end

fibonacci_sequence(100)
