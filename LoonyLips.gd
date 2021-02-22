extends Control

var player_input=[]

#var template=[
#	{
#		"prompts":["a Name", "a movie name", "a superlative"],
#		"story": "Once upon a time %s watched the movie %s and he thought it was the %s movie of past two decades!"
#	},
#	{
#		"prompts": ["an animal", "a verb", "an object" , "a verb ending with ing", "a part of a body", "a disaster","a verb", "another verb","another object"],
#		"story": "One day loony %s thought to %s onto a %s. While it was %s it's %s a %s started. Therefore it could not %s and had to %s on the %s."
#	},
#	{
#		"prompts" : ["a rece (ethnicity)", "an adjective","another adjective", "verb ending with 'ed'", "an object", "another object"],
#		"story": "Once upon a time there lived %s on a %s planet. It was so %s that that it %s %s there! Everybody had to bring %s with them all the time!"
#	}
#]

var current_story = {}

onready var PlayerText=$VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText=$VBoxContainer/DisplayText

func _ready():
	set_current_story()
	DisplayText.text="Hello there adventurer! This is the game called loony lips! We are gonna play a word game! "
	check_story_size()
	PlayerText.grab_focus() #focus on display text
	
func set_current_story():
	randomize()
#	current_story = template[randi() % template.size
	var stories = $StoryBook.get_child_count()
	var selected_story = randi() % stories
	current_story.prompts = $StoryBook.get_child(selected_story).prompts
	current_story.story = $StoryBook.get_child(selected_story).story
	


func _on_PlayerText_text_entered(new_text): #sent node>signal>on enter to main node script to create this mathod
	add_word_to_player_input()
	
#refactoring
func _on_TextureButton_pressed(): #connected button to script
	if is_story_ready():
		get_tree().reload_current_scene()
	else:	
		add_word_to_player_input()

func add_word_to_player_input():
	player_input.append(PlayerText.text) #main work
	DisplayText.text="" #need for resetting text
	PlayerText.grab_focus() #add focus on player input each time new entry given
	PlayerText.clear()
	check_story_size()
	
func is_story_ready():
	return player_input.size() == current_story.prompts.size()
	
func check_story_size():
	if is_story_ready():
		end_game()
	else:
		show_prompt()
		
func show_story():
	DisplayText.text = current_story.story % player_input
	
func show_prompt():
	DisplayText.text += "Can you give me " + current_story.prompts[player_input.size()] + " please"
	
func end_game():
	#DisplayText.visible = false
	
	# $VBoxContainer/HBoxContainer.hide() would work same. To show we say .show()
	
	#but it is a good practice to delete what we don't need completelyS
	
	PlayerText.queue_free() #frees the node from it's painful existence
	show_story()
	$VBoxContainer/HBoxContainer/Label.text="Again!" #challenge!
	$VBoxContainer/HBoxContainer/Label.grab_focus()
 
