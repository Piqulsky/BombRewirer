extends Node

# CONSTANTS

# GLOBAL VARIABLES
var stats := []
var endTime := "00:00:00"

var cablesReAttached := 0
var cutCables := 0
var completed_panels := 0

# GLOBAL SIGNALS
signal start

signal play_animation

signal complete_re_attach
signal complete_energy_cut
signal complete_element_replace
signal complete_catalyst_replace

signal complete_all_panels
signal end_game
