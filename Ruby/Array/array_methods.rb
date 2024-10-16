arr1 = [1, 2, 3, 4, 5]
arr2 = [2, 4, 6, 8, 10]

# 配列の要素を逆順にする
reversed_arr1 = arr1.reverse
puts "arr1の逆順の配列：#{reversed_arr1}"

# 配列の要素をシャッフルする
shuffled_arr1 = arr1.shuffle
puts "arr1をシャッフルした配列：#{shuffled_arr1}"

# 配列の要素をソートする
sorted_arr1 = shuffled_arr1.sort
puts "シャッフルしたarr1をソートした配列：#{sorted_arr1}"

# 配列の要素をソートする（逆順）
sorted_arr1_desc = shuffled_arr1.sort.reverse
puts "シャッフルしたarr1を逆順にソートした配列：#{sorted_arr1_desc}"

# 2つの配列をマージしてソートする
merged_arr = (arr1 + arr2).sort
puts "arr1とarr2をマージしてソートした配列：#{merged_arr}"

# 重複を削除する
unique_arr = merged_arr.uniq
puts "arr1とarr2をマージしてソートした配列から重複を削除した配列：#{unique_arr}"
