class Level
#in order to solve the first level
	def level1
		@warrior.walk!
	end
#in order to solve the second level
	def level2
		if @warrior.feel.enemy?
			@warrior.attack!
		else
			@warrior.walk!
		end
	end
#in order to solve the third level
	def level3
		if @warrior.feel.enemy?
			@warrior.attack!
		else
			if @warrior.health < 20
				@warrior.rest!
			else
				@warrior.walk!
			end
		end
	end
#in order to determine if there's nothing
	def alone?
		@warrior.feel.empty?
    end
#in order to see what look gets
	def alone_distance?
		arr = @warrior.look
		puts "#{arr[0]} and #{arr[1]}"
		
	end
# check if my health is less than 20 means that I'm hurt
	def hurt?
		@warrior.health < 20
	end
# check the actual health status
	def healthstats
		@warrior.health
	end
# in order to know if I can rest
	def resting
		print "hurt:  #{hurt?} healthstats: #{healthstats}  >=  #{@healthy}  \n"
		if hurt?
# if my actual health is more than the health before and there is not a stairs. this check if I'm beeing hurt and if there is not a staris backward. If I'm near of the wall I can rest
			if healthstats >= @healthy and @warrior.feel.stairs? == false
				if @warrior.feel(:backward).wall?
					if @warrior.health < 20
						@warrior.rest!
						print "descanso \n"
					else
						@warrior.walk!
						print "camino adelante \n"
					end
				else
					if @warrior.feel(:backward).enemy?
						@warrior.attak!(:backward)
						print "ataco atras \n"
					elsif @warrior.feel(:backward).captive?
						@warrior.rescue!(:backward)
						print "rescato atras \n"
					else
						@warrior.walk!(:backward)
						print "camino atras \n"
					end
				end
			elsif @warrior.health < 11
				@warrior.walk!(:backward)
			else
				if @warrior.feel.enemy?
					@warrior.attack!
				else
					@warrior.walk!
				end
			end
		else
			@warrior.walk!
		end
	end
# resting condition in for the level 4
	def resting_level4
		if @warrior.feel.enemy?
			@warrior.attack!
		else
			if hurt? and healthstats >= @healthy
				@warrior.rest!
			else
				@warrior.walk!
			end
		end
	end
end