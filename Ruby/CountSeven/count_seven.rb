def count_sevens
  count = 0
  (0..9999).each do |number|
    count += number.to_s.count('7')
  end
  count
end

puts count_sevens
