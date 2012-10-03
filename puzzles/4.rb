filename = ARGV.shift
File.readlines(filename).each do |line|
    puts line.split(' ')[0] if line.include? 'tweet'
end
