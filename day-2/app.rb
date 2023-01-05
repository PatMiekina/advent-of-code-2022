require './day-2.rb'
require './day-2-input.rb'

# game_input = GameInput.new(GAME_TEST)
game_input = GameInput.new(GAME)
game = Game.new(game_input.rounds)
game.play_a_game