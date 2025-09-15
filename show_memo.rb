require 'csv'

CSV.foreach("memo.csv") do |row|
    puts row[0]
end