def main(lines)
  # 入力を変数に格納
  n, m = lines[0].split.map(&:to_i)

  # カップの高さ情報(行数はn)
  bar_array = lines[1..n].map { |line| line.chars.map(&:to_i) }
  # puts "bar_array: #{bar_array.inspect}" # デバッグ用出力

  # 水がたまる量を格納する変数
  total_water = 0

  # 訪問済みチェック用の配列
  visited = Array.new(n) { Array.new(m, false) }

  # 端のセルをすべて訪問済みに設定（水がたまらないセル）
  (0...m).each { |y| visited[0][y] = true; visited[n-1][y] = true }  # 上端・下端
  (0...n).each { |x| visited[x][0] = true; visited[x][m-1] = true }  # 左端・右端

  # 上下左右の移動
  directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]

  # 深さ優先探索 (DFS) のための再帰関数
  def dfs(x, y, bar_array, visited, directions, n, m)
    # 訪問済みなら 0 を返す
    return 0 if visited[x][y]

    # puts "====================" # デバッグ用出力
    # puts "x: #{x}, y: #{y}" # デバッグ用出力

    # 現在のセルを訪問済みに設定
    visited[x][y] = true

    # 現在の位置の高さ
    current_height = bar_array[x][y]
    # puts "current_height: #{current_height}" # デバッグ用出力

    # 現在の位置がnilの場合は無限大を返し水がたまらないようにする
    return Float::INFINITY if current_height.nil?

    # 周囲のセルを見て、水がたまるか計算
    min_water = Float::INFINITY

    directions.each do |dx, dy|
      nx, ny = x + dx, y + dy
      # puts "nx: #{nx}, ny: #{ny}" # デバッグ用出力
      # 範囲外チェック
      next if nx < 0 || nx >= bar_array.length || ny < 0 || ny >= bar_array[0].length

      # 隣接セルの高さを取得
      neighbor_height = bar_array[nx][ny]
      # puts "neighbor_height: #{neighbor_height}" # デバッグ用出力
      next if neighbor_height.nil?

      # 隣接セルが端であるかのチェック
      is_edge = (nx == 0 || nx == n - 1 || ny == 0 || ny == m - 1)

      # 現在のセルより低い隣接セルがある場合、水は溜まらない
      # または、隣接セルが端であり、同じ高さの場合も水は溜まらない
      if neighbor_height < current_height || (neighbor_height == current_height && is_edge)
        # puts "水が溜まらないため次に進む" # デバッグ用出力
        return 0
      end

      # 差分計算（水が溜まる部分）
      if current_height < neighbor_height
        min_water = [min_water, neighbor_height - current_height].min
        # puts "min_water: #{min_water}" # デバッグ用出力
      end
    end

    # 水がたまらない場合（min_waterが無限大のまま）0を返す
    if min_water == Float::INFINITY
      0
    else
      # 現在のセルに溜まった水を反映
      bar_array[x][y] += min_water
      min_water
    end
  end

  # 各セルを探索し、水がたまる量を計算
  (0...n).each do |i|
    (0...m).each do |j|
      water = dfs(i, j, bar_array, visited, directions, n, m)
      total_water += water if water != Float::INFINITY
      # puts "total_water: #{total_water}" # デバッグ用出力
    end
  end

  # 結果を表示
  # puts "total_water: #{total_water}"
  puts total_water
end

# 試験データをファイルに読み込んでmainに渡す
file_path = ARGV[0] || 'input/test06.txt' #デフォルトでtest01.txtを読み込む
readlines = File.readlines(file_path, chomp: true)
main(readlines)
