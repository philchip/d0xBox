# MOVE ME TO TEST

# WHY THE FUCK ARE BOOLS HAVING SUCH A PROBLEM WITH '?'
require 'rubygems' 
require 'open-uri'
require 'nokogiri'


module D0xWeb
	def self.bbb(s) # bit-by-bit printing
		s.each_char { |c| putc c; sleep 0.025; STDOUT.flush }
		print "\n\n"
		sleep(2)
	end
	
	def self.bbb_sl(s)
		s.each_char { |c| putc c; sleep 0.025; STDOUT.flush }
		prints "\n"
	end
	
	def self.clean_text(t) # cleans a string of tags
		t.gsub(/'<>'/,'')
	end
	

	def self.page_search(p) # page_search text for a term
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
				page_search(p)
			elsif choice == 'n'
				return
			else
				puts 'Character unrecognised.'
				page_search(p)
			end

		else
			print 'No result found. Search for another term? y/N: '
			choice = gets.chomp.downcase
			if choice == 'y'
				page_search(p)
			elsif choice == 'n'
				return
			else
				puts 'Character unrecognised.'
				page_search(p)
			end
		end
	end

	# specify webpage to grab... auto append prefixes
	def self.grab_page(p, options = {})
		needs_http = false
		needs_http = true if p.downcase.scan(/http:\/\//).count == 0
		needs_www = false
		needs_www = true if p.downcase.scan(/www./).count == 0

		p.insert(0,'www.') if needs_www
		p.insert(0,'http://') if needs_http
		grabbed = Nokogiri::HTML(open(p))
		grabbed = clean_text(grabbed.text) if options[:text]
	end

	# get input off user...
	def self.get_input_page
		'Hi there! Enter page to read: '.each_char do |c|
			putc c
			sleep 0.025
			STDOUT.flush
		end
		page = gets.chomp

		'Do you want to store this whole page as text? y/N: '
		.each_char do |c|
			putc c
			sleep 0.025
			STDOUT.flush
		end
		choice = gets.chomp.downcase

		if choice ==  'y'
			puts "Storing webpage as text..."
			grab_page(page, text: true)
		else
			grab_page(page)
			puts 'Page grabbed.'
		end
	end

	# man <- check bbb timers
	def self.help
		bbb 'D0xWeb is a collection of tools to catalog and search webpages.'
		bbb 'It may be used as a generic starting point for more complex scrapes, ' +
		'and is often employed as part of more specialised search modules.'
	end
end
