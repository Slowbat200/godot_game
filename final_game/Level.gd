extends Node2D

export var viewport_width = 640
export var scroll_speed = 200

var player
var viewport

func _ready():
	player = get_node("/root/MyGame/Player") # nastavte cestu ke hráči
	viewport = get_viewport()

func _process(delta):
	if player.position.x > viewport.get_visible_rect().size.x / 2:
		scroll_viewport()
		
func scroll_viewport():
	var new_x = viewport.get_scroll().x + scroll_speed * get_process_delta_time()
	var max_x = get_node("MaxRight").position.x # nastavte pozici nejvzdálenější platformy vpravo
	new_x = clamp(new_x, 0, max_x - viewport_width)
	viewport.set_scroll(Vector2(new_x, 0))
