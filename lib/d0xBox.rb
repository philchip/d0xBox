require 'rubygems'
require 'nokogiri'
require_relative './d0xBox/d0xTools' # Really? You call that >clean?<
require_relative './d0xBox/d0xHelp'

$targets = ['Facebook', 'Google', 'Twitter', 'Website', 'Images']
$targets_short = ['F', 'G', 'T', 'W', 'I']

class D0xClient(*targets)
  def initialize
    D0xTools::bbb_sl "New client initialised. Targets: #{targets}"
  end
end


def start
  while true
    exit(1) if gets.chomp.downcase = 'exit'
    start if gets.chomp.downcase = 'restart'
    d0xHelp::run if gets.chomp.downcase = 'help'
  end
  
  print <<stop
     _ _____     ______  _____      
    | |  _  |    | ___ \|  _  |     
  __| | |/' |_  _| |_/ /| |/' |_  __
 / _` |  /| \ \/ / ___ \|  /| \ \/ /
| (_| \ |_/ />  <| |_/ /\ |_/ />  < 
 \__,_|\___//_/\_\____/  \___//_/\_\ 0.1
stop
  
  D0xTools::bbb "        Not yet implemented(TM)"
  D0xTools::bbb_sl "Welcome to d0xB0x. Enter start-up command, or type \'help\'."
  input = gets.chomp
  
  print'DEBUG: QUITTING'
end

=begin MOVE ME TO DEDICATED d0xHelp.rb
def help(s)
  case s
  when 'self'
    puts 'PRINT GENERAL HELPFILE'
  when 'other methods'
    puts 'METHOD SPECIFIC HELPFILES'
  else
    puts 'Unknown help parameter. Usage: help(command) or help'
  end
end
=end

def spawn_client
  D0xTools::bbb_sl 'Enter target(s): '
  target = gets.chomp
  
  if target == 'valid'
    client = new D0xClient(*targets)
  elsif target == 'targets'
    print 'targets'
  else
    puts 'Invalid target(s). Type \'targets\' for a list of targets to scrape.'
    spawn_client
  end
end

if __FILE__ == $PROGRAM_NAME ### Is there a better way to implement main in Ruby?
  start
end





