require 'csv'

csv_text = File.read('corrupt_reasons.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  puts(row.to_hash['id'])
end