extends Node2D
# Global

# warning-ignore:unused_signal
signal bomb_count_updated(value)
# warning-ignore:unused_signal
signal game_over
# warning-ignore:unused_signal
signal gift_count_updated(value)
# warning-ignore:unused_signal
signal senta_health_updated(value)
# warning-ignore:unused_signal
signal start_game
# warning-ignore:unused_signal
signal quit_game
# warning-ignore:unused_signal
signal restart_game

var camera
var child
var game
var game_over_screen
var senta
