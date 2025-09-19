require 'csv'

puts "1: 新規作成 2: 既存ファイル編集"
choice = gets.chomp

#入力チェック
until choice == "1" || choice == "2"
  puts "1か2を入力してください(半角)"
  choice = gets.chomp
end

puts "ファイル名を入力してください"
filename = gets.chomp

# 入力したファイル名に拡張子がなければ .csv を付ける
filename += ".csv" unless filename.end_with?(".csv")

puts "メモしたい内容を入力してください(複数行OK、終了する場合は 'Ctrl+D' を入力)"

memo_lines = []
while line = gets
  line.chomp!
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