require './day-2-input'

class GameInput
    attr_accessor :rounds

    def initialize(input)
        @initial_input = input
        @rounds = split_input_into_sub_arrays
    end

    def split_input_into_sub_arrays
        @initial_input.split("\n").map do |round|
            round.split(" ").map do |symbol|
                symbol
            end
        end
    end
end

class Game
    def initialize(game_history)
        @points_for_symbols = {"A": 1, "B": 2, "C": 3, "X": 1, "Y": 2, "Z": 3}
        @winner = ""
        @round_winner = nil
        @winning_symbol = ""
        @player1 = Player.new
        @player2 = Player.new
        @game_history = game_history
    end

    def assign_round_symbols_to_players(round)
        @player1.round_symbol = round[0]
        @player2.round_symbol = round[1]
    end

    def find_winning_symbol
        # A / Y Rock
        # B / X Paper
        # C / Z Scissors
        player_1_symbols = ["A", "B", "C"]
        player_2_symbols = ["X", "Y", "Z"]

        player_1_index = player_1_symbols.find_index(@player1.round_symbol)
        player_2_index = player_2_symbols.find_index(@player2.round_symbol)
        
        # Win combinations:
        # Y - C; X - A ; Z - B
        # index_p1 / index_p1 - 1 
        puts "Player symbols: #{@player1.round_symbol}:#{@player2.round_symbol}"
        # Draw
        if player_1_index == player_2_index
            @winning_symbol = nil
        elsif (player_1_index == (player_2_index.to_i - 1)) || (player_2_index == 0 && player_1_index == 2)
            @winning_symbol = @player2.round_symbol
        else
            @winning_symbol = @player1.round_symbol
        end
        puts "Winning symbol: #{@winning_symbol}"
        @winning_symbol
    end

    def find_round_winner
        if ["A", "B", "C"].include?(@winning_symbol)
            @round_winner = @player1
        elsif ["X", "Y", "Z"].include?(@winning_symbol)
            @round_winner = @player2
        else
            @round_winner = nil
        end
        @round_winner
    end

    def add_round_score_to_overall

        @player1.score += @points_for_symbols[@player1.round_symbol.to_sym]
        @player2.score += @points_for_symbols[@player2.round_symbol.to_sym]

        puts "Score before winning: player1: #{@player1.score}; player2: #{@player2.score}"
        if @round_winner
            @round_winner.score += 6
        else
            @player1.score += 3
            @player2.score += 3
        end

        puts "Score after winning: player1: #{@player1.score}; player2: #{@player2.score}"
    end

    def final_score
        puts "Final score is Player1: #{@player1.score}, Player2: #{@player2.score}"
        puts "The winner is Player 1!" if @player1.score > @player2.score
        puts "The winner is Player 2!" if @player1.score < @player2.score
    end

    def play_a_game
        @game_history.each_with_index do |round, index|
            puts "Round #{index + 1}"
            self.assign_round_symbols_to_players(round)
            self.find_winning_symbol
            self.find_round_winner
            self.add_round_score_to_overall
        end
        self.final_score
    end
end

class Player
    attr_accessor :score, :round_symbol

    def initialize
        @score = 0
        @round_symbol = ""
    end
end

# game_input = GameInput.new(GAME_TEST)
game_input = GameInput.new(GAME)
game = Game.new(game_input.rounds)
game.play_a_game