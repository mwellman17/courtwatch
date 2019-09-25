require 'pry'

# Read the http response body
file = File.open("./responses/2018-municipal").read()

# Find the array containing all counties, offenses, and numbers.
# Clean it up and make it a usable array.
response = file.match( /\[(\"FY20.+?)\}/ )
response_array = response.captures[0]
response_array.gsub!('","','+++')
response_array.gsub!('"', '')
response_array = response_array.split('+++')

# Find the alias values that correspond to the numbers of crimes committed in each county.
index_matches = file.scan( /\"aliasIndices\":\[(.+?)\]/ )
num_alias = index_matches.last[0].split(',')
num_alias.each_with_index do |num, index|
  num_alias[index] = num.to_i * -1 - 1
end
num_alias.reverse!

# Find the alias values that correspond to the names of counties ranked by number of offenses.
county_alias = index_matches[-3][0].split(',')
county_alias.each_with_index do |num, index|
  county_alias[index] = num.to_i
end
county_alias.reverse!

# Find the name of the selected offense.
offense = response_array[index_matches.first.first.to_i]

# Print the data to the console.
puts response_array[2].strip
puts offense
county_alias.each_with_index do |county, index|
  puts "#{response_array[county]}: #{response_array[num_alias[index]]}"
end
