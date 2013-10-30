# MOVE ME TO TEST
require 'rubygems' 
require 'open-uri'
require 'nokogiri'

def bbb(s) # bit-by-bit printing
	s.each_char { |c| putc c; sleep 0.025; STDOUT.flush }
	print "\n\n"
	sleep(2)
end

def search(p) # search text for a term
	puts 'Yo. Enter search term: '
	term = gets.chomp.downcase
	count_results = p.downcase.scan(term).count
	result_found = true
	result_found = false if count_results == 0

	if result_found
		print "Result found. Occurrences: #{count_results}\n"
		print 'Search again? y/N: '
		choice = gets.chomp.downcase
		if choice == 'y'
			search(p)
		elsif choice == 'n'
			return
		else
			puts 'Character unrecognised.'
			search(p)
		end

	else
		print 'No result found. Search for another term? y/N: '
		choice = gets.chomp.downcase
		if choice == 'y'
			search(p)
		elsif choice == 'n'
			return
		else
			puts 'Character unrecognised.'
			search(p)
		end
	end
end


# grab the HTML from a page...
lipsum = Nokogiri::HTML(open("http://www.lipsum.com")) 

# grab any titles of page from that HTML using Xpath, 
# via scanning HTML for <h1> tag
lipsum.xpath('//h1').each do |node|
	puts 'Page Title: ' + node.text 
end

# grab first paragraph from page, remove meaningless babble
para = lipsum.xpath('//p').first.text # declaration for readability...
bbb para.gsub('/<>/','') # remove characters, replace with ''
# sweet unintended effect... seems to be removing tag 
# along with angle brackets

# para is stored as a string, so let's search it...
search(para)


