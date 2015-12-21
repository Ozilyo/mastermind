
module MasterMind
	class Game
		attr_reader :board, :code, :player

		def initialize(player, board = Board.new)
			@player = Player.new(player)
			@board = board
			@code = board.secret_code
		end

		def solicit_guess guesses_remaining
			"#{player.name} you have #{12 - guesses_remaining} guesses remaining, enter 4 of the available colors seperated by spaces:"
		end

		def get_guess(guess = gets.chomp.split(/\W+/).slice!(0,4))
			get_color_code(guess)
		end

		def play
			guesses = 0
			while guesses < 12
				puts "guesses = #{guesses}"
				puts solicit_guess(guesses)
				current_guess = board.grid_update(guesses, get_guess)
				
				puts board.feedback(current_guess)
				# puts board.formatted_grid
				if board.game_over
					puts game_over_msg
					# board.formatted_grid
					return
				end
				guesses += 1
				
			end
		end

		def game_over_msg
			return "congrats!" if board.game_over == :winner
			return "better luck next time." if board.game_over == :loser
		end


		private
		def get_color_code(guess)
			guess.map { |color| CodePeg.colors[color.to_sym] }
		end
	end
end