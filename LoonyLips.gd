extends Control

var player_input=[]
var prompts=["a Name", "a movie name", "a superlative"]
var story= "Once upon a time %s watched the movie %s and he thought it was the %s movie of past two decades!"

onready var PlayerText=$VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText=$VBoxContainer/DisplayText

func _ready():
	DisplayText.text="Hello there adventurer! This is the game called loony lips! We are gonna play a word game! "
	check_story_size()


func _on_PlayerText_text_entered(new_text): #sent node>signal>on enter to main node script to create this mathod
	add_word_to_player_input()
	
#refactoring
func _on_TextureButton_pressed(): #connected button to script
	add_word_to_player_input()

func add_word_to_player_input():
	player_input.append(PlayerText.text)
	DisplayText.text=""
	PlayerText.clear()
	check_story_size()
	
func is_story_ready():
	return player_input.size() == prompts.size()
	
func check_story_size():
	if is_story_ready():
		show_story()
	else:
		show_prompt()
		
func show_story():
	DisplayText.text = story % player_input
	
func show_prompt():
	DisplayText.text += "Can you give me " + prompts[player_input.size()] + " please"

