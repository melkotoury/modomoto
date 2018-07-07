require 'csv'

csv_text = File.read('corrupt_reasons.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  id = row.to_hash['id']
  reasons = row.to_hash['retoure_reason']
  if (reasons.to_i <= 10 && reasons.to_i >= 1) || reasons == 'x1'|| reasons =='x2'|| reasons =='x3' || reasons =='x4'
  #   data should return the same value as it is correct
  else
    corrected = reasons.gsub(/:|\./, ',')
    puts reasons
    puts id
  end
end