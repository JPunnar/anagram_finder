start_time = Time.now

dict = Hash.new{|h,k| h[k] = [] }
file = File.open(ARGV.first, encoding: 'iso-8859-1')

file.each_line do |word|
  word.strip!
  dict[word.chars.sort.join] << word
end
file.close

anagrams = dict[ARGV.last.chars.sort.join] - [ARGV.last]

if anagrams.empty?
  puts "#{((Time.now - start_time) * 1000000).round}, no anagrams were found"
else
  puts "#{((Time.now - start_time) * 1000000).round}, #{anagrams.join(', ')}"
end

