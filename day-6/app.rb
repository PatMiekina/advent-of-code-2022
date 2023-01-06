require_relative './day-6'
require_relative './day-6-input'

signal = CommsSignal.new(SIGNAL)
signal.check_signal_for_four_unique_chars
p signal.return_signal_marker