extends PanelContainer

@export var weapon : Weapon:
	set(value):
		weapon = value
		if not is_node_ready():
			await ready
		if value == null:
			return
		$TextureRect.texture = value.texture
		if value.cooldown > 0:
			$Cooldown.wait_time = value.cooldown
		
#Include a refresh timer of the UI for each weapon to indicate the cooldown
func _on_cooldown_timeout():
	if weapon:
		if weapon.cooldown > 0:
			$Cooldown.wait_time = weapon.cooldown
		weapon.activate(owner, owner.nearest_enemy, get_tree())
	
