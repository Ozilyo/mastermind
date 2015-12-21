module MasterMind
	class KeyPeg
		attr_reader :color, :feedback

		def initialize(colors=Hash.new(0))
			@color = colors
		end
	end
end