require 'csv'

puts "1: 新規作成 2: 既存ファイル編集"
choice = gets.chomp

#入力チェック
until choice == "1" || choice == "2"
    puts "1か2を入力してください～！"
    choice = gets.chomp
end

puts "メモしたい内容をここに入力してください～！"
STDOUT.flush # 案内強制表示
memo = gets.chomp #　入力待ち状態

mode = choice == "1" ? "w" : "a"
CSV.open("memo.csv", mode) do |csv|
    csv << [memo] #　入力した内容を1行として書き込む
end

puts "書き込み完了～！"

puts "入力確認: #{memo}"
