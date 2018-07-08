require 'csv'

csv_text = File.read('corrupt_reasons.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  id = row.to_hash['id']
  reasons = row.to_hash['retoure_reason']
  if (reasons.to_i <= 10 && reasons.to_i >= 1) || reasons == 'x1'|| reasons =='x2'|| reasons =='x3' || reasons =='x4'
    #   data should return the same value as it is correct
    puts id
    puts reasons
    # write_to_csv(id,reasons)
    header = ['id','retoure_reason']
    CSV.open('corrected.csv','a') do |csv|
      row = CSV::Row.new(header,[])
      row['id'] = id.to_s
      row['retoure_reason'] = reasons.to_s
      csv << row
    end
  elsif reasons.to_i >= 10**6
    corrected = 8
    puts id
    puts reasons + ' corrected to ' + corrected.to_s
    # write_to_csv(id, corrected)
    header = ['id','retoure_reason']
    CSV.open('corrected.csv','a') do |csv|
        row = CSV::Row.new(header,[])
        row['id'] = id.to_s
        row['retoure_reason'] = corrected.to_s
        csv << row
      end
  else
    # add comma to numbers
    corrected = separate_comma(reasons)
    puts id
    puts reasons + ' corrected to ' + corrected
    # write_to_csv(id, corrected)
    header = ['id','retoure_reason']
    CSV.open('corrected.csv','a') do |csv|
      row = CSV::Row.new(header,[])
      row['id'] = id.to_s
      row['retoure_reason'] = corrected.to_s
      csv << row
    end
  end

  def separate_comma(number)
    number.to_s.chars.to_a.reverse.each_slice(1).map(&:join).join(',').reverse
  end

end