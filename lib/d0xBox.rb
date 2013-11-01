require 'rubygems'
require 'nokogiri'
require_relative './d0xBox/d0xTools' # Really? You call that >clean?<
require_relative './d0xBox/d0xHelp'
#require_relative './d0xB0x/d0xImg'
#require_relative './d0xB0x/d0xGgl'
#require_relative './d0xB0x/d0xFB'
#require_relative './d0xB0x/d0xTwit'

$targets = ['Facebook', 'Google', 'Twitter', 'Website', 'Images']
$targets_short = ['F', 'G', 'T', 'W', 'I']
$targets_set = []
$clients = []

class D0xClient
	@targets = $targets_set
	@name = nil
	
	def initialize
		D0xTools.bbb_sl "New client initialised. \n" #test: check whether escape works with bbb
		D0xTools.bbb_sl "Targets: #{@targets}."
		client_thread = Thread.new { self.start(@targets) }.join
	end 
	
	def start(*targets)
		puts 'DEBUG: CLIENT START METHOD CALLED. THREAD 3.'
		D0xTools.bbb_sl "Please give a name to this search: "
		@name = gets.chomp
		$clients << @name
		
		@targets.each do |t|
			case t.downcase
			when 'f', 'facebook'
				# D0xFB.start
			when 'g', 'google'
				# D0xGgl.start
			when 't', 'twitter'
				# D0xTwit.start
			when 'w', 'website'
				# D0xTools.start
			when 'i', 'images'
				# D0xImg.start
      end
		end
	end
	
	def kill(name)
		D0xTools.bbb_sl 'Really cancel this search? y/N: '
		choice = gets.chomp
		if choice.downcase == self.name
			self.garbage_collect
			D0xTools.bbb_sl 'Search cancelled.'
		end
	end
end

class Main 
  def start
  	puts <<-eos

  	         8I          dP"""88""""""Y8,              
  	         8I          Yb,  88      `8b              
  	         8I           `"  88      ,8P              
  	         8I               88aaaad8P"               
  	   ,gggg,8I     ,gg,   ,gg88""""Y8ba     ,gg,   ,gg
  	  dP"  "Y8I    d8""8b,dP" 88      `8b   d8""8b,dP" 
  	 i8'    ,8I   dP   ,88"   88      ,8P  dP   ,88"   
  	,d8,   ,d8b,,dP  ,dP"Y8,  88_____,d8',dP  ,dP"Y8,  
  	P"Y8888P"`Y88"  dP"   "Y888888888P"  8"  dP"   "Y8   V0.1                                           
                                                  
    eos
   
  	D0xTools.bbb "        				Not yet implemented(TM)"
  	D0xTools.bbb_sl "Welcome to d0xB0x. Enter start-up command, or type \'help\'."
  	puts''
  	input_thread = Thread.new { watch_input }.join
  end

  def spawn_client(x = 'default', *t)
  	target_valid = true
  	if x == 'default'
   		D0xTools.bbb_sl 'Enter target(s): '
   		input = gets.chomp.to_s.downcase!
    else
      scan_array = $targets.map { |e| e.downcase! }
      scan_array << $targets_short.each { |e| e.downcase }
      scan_string = scan_array.join(' ')
      t << x
      input = t.join(' ')
    end
  	target_valid = false unless scan_string.include?(input)

  	if target_valid == true
  		targets = $targets_set
  		client = D0xClient.new
  	else
  		puts 'Invalid target(s). Type \'targets\' for a list of targets to scrape.'
  	end
  end

  def watch_input
  	puts 'DEBUG: INPUT THREAD STARTED. THREAD 2.'
  	loop do
  		case gets.chomp.downcase

  		when 'help'
  			D0xHelp.run

  		when 'exit'
  			exit(1)

  		when 'restart'
        #client_thread.stop
  			start

  		when 'targets'
  			D0xTools.bbb_sl 'Potential targets:'
  			D0xTools.bbb_sl $targets.to_s
  			puts''
  			D0xTools.bbb_sl "These may be accessed using the following abbreviations:"
  			D0xTools.bbb_sl $targets_short.to_s
  			puts''

      when 'new'
        spawn_client('facebook')

  		else
  			puts 'Command not recognised.'
  		end
  	end
  end
end

if __FILE__ == $PROGRAM_NAME
	main_thread = Thread.new { main = Main.new.start }.join
end






