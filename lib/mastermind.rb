# require "mastermind/version"

module Mastermind
  # Your code goes here...
end

require_relative "./mastermind/player.rb"
# require_relative "./mastermind/key_peg.rb"
require_relative "./mastermind/code_peg.rb"
require_relative "./mastermind/board.rb"
require_relative "./mastermind/game.rb"
require_relative "./mastermind/core_extensions.rb"

puts "Welcome to mastermind, the computer generated a code type your guess to solve it: "

MasterMind::Game.new('Ali').play
