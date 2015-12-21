require "spec_helper.rb"

module MasterMind
	describe CodePeg do
	  
		it 'initializes to a color of \'white\' when no argument is provided ' do
			expect(CodePeg.new.color).to eq ''
		end

	end
end