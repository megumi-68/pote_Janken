require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください"
  file = gets.chomp
  
  puts"メモの内容を記入して下さい。Ctrl+Dで保存します。"
  input_memo = STDIN.read
  memo = input_memo.chomp
  CSV.open("#{file}.csv" , "w") do |csv|
    csv.puts ["#{memo}"]
  end

elsif memo_type == 2
  puts "拡張子を除いたファイル名を入力してください"
  file = gets.chomp
  puts "メモの編集内容を記入して下さい。Ctrl+Dで保存します。"
  input_memo = STDIN.read
  memo = input_memo.chomp
  CSV.open("#{file}.csv" , "a") do |csv|
    csv.puts ["#{memo}"]
  end
else 
  puts "1 or 2を入力してください"
end