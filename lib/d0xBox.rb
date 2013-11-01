require 'rubygems'
require 'nokogiri'
require_relative './d0xBox/d0xTools' # Really? You call that >clean?<
require_relative './d0xBox/d0xHelp'

$targets = ['Facebook', 'Google', 'Twitter', 'Website', 'Images']
$targets_short = ['F', 'G', 'T', 'W', 'I']

class D0xClient
	
end

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
 
	D0xTools::bbb "        				Not yet implemented(TM)"
	D0xTools::bbb_sl "Welcome to d0xB0x. Enter start-up command, or type \'help\'."
	puts''
	input_thread = Thread.new {watch_input}.join
end

def spawn_client(*targets = 'none')
	target_valid = true
	if targets = 'none'
 		D0xTools::bbb_sl 'Enter target(s): '
 		input = gets.chomp
	else
		break	 
  	end
  
	unless $targets.include? targets ||
	$targets_short.include? targets then
		target_valid = false
	end 
  
  
	if target_valid == true
		client = new D0xClient(*targets)
	else
		puts 'Invalid target(s). Type \'targets\' for a list of targets to scrape.'
    		spawn_client
	end
end

def watch_input
	loop do
		case gets.chomp.downcase

		when 'help'
			D0xHelp::run

		when 'exit'
			exit(1)

		when 'restart'
			start

		when 'targets'
			D0xTools::bbb_sl 'Potential targets:'
			D0xTools::bbb_sl $targets.to_s
			puts''
			D0xTools::bbb_sl "These may be accessed using the following abbreviations:"
			D0xTools::bbb_sl $targets_short.to_s
			puts''

		else
			puts 'Command not recognised.'
		end
	end
end

if __FILE__ == $PROGRAM_NAME 
	main_thread = Thread.new {start}.join
end





