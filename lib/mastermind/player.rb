module MasterMind
	class Player
		attr_reader :name
		begin
			def initialize(name)
				@name = name
			end
		rescue
			puts "invalid name"
		end
	end
end