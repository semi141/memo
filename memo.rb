# Windows環境では Control+D が使えないため、入力終了は 'END' としています。
# それ以外の実装要件は提出時の課題仕様に沿っています。

require 'csv'

puts "ファイル名を入力してください"
filename = gets.chomp


# 入力したファイル名に拡張子がなければ .csv を付ける
filename += ".csv" unless filename.end_with?(".csv")


puts "1: 新規作成 2: 既存ファイル編集"
choice = gets.chomp

#入力チェック
until choice == "1" || choice == "2"
  puts "1か2を入力してください"
  choice = gets.chomp
end

puts "メモしたい内容を入力してください(複数行OK、終了する場合は 'END' を入力)"

memo_lines = []
while true
  line = gets.chomp
  break if line == "END"
  memo_lines << line
end

mode = choice == "1" ? "w" : "a"
CSV.open(filename, mode) do |csv|
  memo_lines.each do |line|
    csv << [line]
  end
end

puts "書き込み完了"

puts "入力確認"

memo_lines.each { |line| puts line}