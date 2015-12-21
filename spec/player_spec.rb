require "spec_helper.rb"
module MasterMind
	describe Player do
	  context "#initialize" do
	  	it 'accepts an input and assigns it to @name' do
	  		player = Player.new("ali")
	  		expect(player.name).to eq "ali"
	  	end
	  end
	end
end