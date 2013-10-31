require 'rubygems'
require 'nokogiri'
require_relative './d0xBox/d0xWeb' # Really? You call that >clean?<

class D0xClient
  def initialize
  end
end


def start
  print <<stop
     _ _____     ______  _____      
    | |  _  |    | ___ \|  _  |     
  __| | |/' |_  _| |_/ /| |/' |_  __
 / _` |  /| \ \/ / ___ \|  /| \ \/ /
| (_| \ |_/ />  <| |_/ /\ |_/ />  < 
 \__,_|\___//_/\_\____/  \___//_/\_\ 0.1
stop
  
  D0xWeb::bbb "        Not yet implemented(TM)"
  D0xWeb::bbb_sl "Welcome to d0xB0x. Enter start-up command, or type \'help\'."
  input = gets.chomp
end

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

if __FILE__ == $PROGRAM_NAME ### Is there a better way to implement main in Ruby?
  start
end





