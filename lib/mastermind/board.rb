module MasterMind
	class Board
		attr_reader :grid, :secret_code

		attr_accessor :guess, :key_peg

		def initialize(input={})
			@grid = input.fetch(:grid, default_grid)
			# @secret_code = [0,4,1,0]
			@secret_code = generate_code
			# @key_peg = KeyPeg.new
			@key_peg = Hash.new(0)
		end

		# def formatted_grid
		# 	grid.each {|raw| 
		# 		puts raw.map { |code_peg| code_peg.color_code.empty? ? "_" : code_peg.class.colors.key(color_code)}.join(" ")
				
		# 	}
		# end

		def grid_update(order, current_guess)
			grid[order].each_with_index {|code_peg, index|
				code_peg.color_code = current_guess[index]
			}

			self.guess = current_guess

		end

		def feedback(current_guess)
			@key_peg = Hash.new(0)
			# puts guess.inspect
			# puts secret_code.inspect
			rights = reds(current_guess)
			almosts = whites(current_guess)
			return "#{rights} red(s), #{almosts} white(s) "
			# return reds(current_guess), whites(current_guess)
		end

		def reds(current_guess)
			current_guess.each_with_index { |g, i|
				key_peg[:red] += 1 if red?(g, i)
			}
			return key_peg[:red]
		end

		def whites(current_guess)
			comparator = secret_code.dup
			#eleminate the exact matches from the comparator array before checking for whites
			# current_guess.each_with_index	{ |g, i| 
			# 	comparator.delete_at(i) if red?(g,i)
			# }

			comparator.select!.with_index {|g,i| g != current_guess[i] }
			# puts "match_whites = #{comparator.inspect}"
			current_guess.each_with_index{ |g, i|
				if white?(g, i, comparator)
					key_peg[:white] += 1
					comparator.delete_at(i)
				end
			}
			return key_peg[:white]
		end

		def game_over
			return :winner if winner?(self.guess)
			return :loser if loser?
			false
		end


		private

		def default_grid
			Array.new(12) { Array.new(4) {CodePeg.new} }
		end
	
		def generate_code
			Array.new(4) { |i| rand(6) }
		end

		def loser?
			# puts grid.last.inspect
			#  puts (grid.last.map { |code_peg| code_peg.color_code.to_s }.inspect)
			# puts (grid.last.map { |code_peg| code_peg.color_code.to_s }.none_empty?)
			grid.last.map { |code_peg| code_peg.color_code.to_s }.none_empty?
		end

		def winner?(guess)
			guess == secret_code
		end

		def red?(guess, index)
			guess == secret_code[index]
		end

		def white?(guess, index, comparator)
			comparator.include?(guess)
		end

	end
end