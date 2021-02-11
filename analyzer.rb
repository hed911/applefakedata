require 'csv'
good_phones = 0
bad_phones = 0

CSV.foreach("dataset.csv", col_sep: ';', headers: true) do |row|
  performance = row[3]
  good_phones += 1 if performance == 'GOOD'
  bad_phones  += 1 if performance == 'BAD'
end
puts "GOOD: #{good_phones}"
puts "BAD: #{bad_phones}"
puts "TOTAL: #{good_phones + bad_phones}"