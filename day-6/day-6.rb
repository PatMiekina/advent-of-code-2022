require './day-6-input'

class CommsSignal
    attr_accessor :current_four_chars, :marker_index

    def initialize(string)
        @signal = string
        @current_four_chars = string[0,4].split("")
        @marker_index = 4
    end

    def all_four_chars_unique?
        @current_four_chars.length == @current_four_chars.uniq.length ? true : false
    end

    def check_signal_for_four_unique_chars
        return true if self.all_four_chars_unique?
        @signal.split("").each_with_index do |char, index|
            next if index <= 3
            @marker_index += 1
            @current_four_chars.shift
            @current_four_chars << char
            return true if self.all_four_chars_unique?
        end
    end

    def return_signal_marker
        @marker_index
    end
end