#this class read the README file in order to know what level i'm facing
require 'readfile.rb'
#class that I use in order to complete the methods
require 'level.rb'
class Actions < Level
	def act(warrior)
		begin
			@r = ReadFile.new()
			@warrior = warrior
			if @r.content() == "Level 1"
				level1
			elsif @r.content() == "Level 2"
				level2
			elsif @r.content() == "Level 3"
				level3
			elsif @r.content()=="Level 4"
				if(alone?)
					resting_level4
				else
					if warrior.feel.enemy?
						warrior.attack!
					else
						warrior.rescue!		
					end
				end
				@healthy = warrior.health
			elsif @r.content()=="Level 7"
				if warrior.feel.wall?
					warrior.pivot!
				else
					if(alone?)
						resting
					else
						if warrior.feel.enemy?
							warrior.attack!
						else
							warrior.rescue!		
						end
					end
				end
				@healthy = warrior.health
			elsif @r.content() == "Level 8"
				arr = warrior.look
				alone_distance?
				if arr[0] == "nothing" and arr[1] == "Wizard"
					warrior.shoot!
				elsif arr[0]== "Wizard" and arr[1] == "Wizard" 
					warrior.shoot!
				else
					if warrior.feel.captive?
						warrior.rescue!
					else
						warrior.walk!
					end
				end
					
				@healthy = warrior.health
			else
				if(alone?)
					resting
				else
					if warrior.feel.enemy?
						warrior.attack!
					else
						warrior.rescue!		
					end
				end
				@healthy = warrior.health
			end
		rescue => exception
			puts "\n An Error Ocurrs, please review the following: \n"
			@error_message="#{$!}"
			puts "#{@error_message}"
			puts exception.backtrace
			exit
		end
	end
end
