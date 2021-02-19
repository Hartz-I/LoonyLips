extends Control

func _ready():
	#var person="yan" #alt+down key to move a line down
	var prompts=["Yann", "Minions", "Greatest"]
	var story= "Once upon a time %s watched the movie %s and he thought it was the %s movie of past two decades!"
	print(story % prompts) #plug in into story what you havent used from promps

	#exercise
	"""
	prompts=["Inan", "game development", "good", "joy", "singing" , "dancing"]
	story="One day a boy named %s started learning %s. He was amazed at the fact that he was so %s at it! Filled with %s he started %s and %s!"
	print(story % prompts)
	
	prompts=["Rick", "banking", "stupid", "glamour", "kicking" , "punching"]
	print(story % prompts)
	"""
	
	#story and the prompt should have the same number of arguments! or you'll get an error!
	
