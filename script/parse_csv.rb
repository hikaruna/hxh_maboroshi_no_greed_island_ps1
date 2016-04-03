require 'csv'
require 'yaml'

if ARGV.size < 2
  puts "Usage ruby script/parse_csv.rb file col1 col2 col3"
  exit 1
end

puts CSV.foreach(ARGV.shift).map {|row|
  Hash[
    ARGV.map.with_index do |column,i|
      [ column, row[i] ]
    end
  ]
}.to_yaml
