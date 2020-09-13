extends Label

onready var s = get_parent().score

func _ready():
    text = str(s[0]) + "  -  " + str(s[1])

func _process(delta):
    text = str(s[0]) + "  -  " + str(s[1])
