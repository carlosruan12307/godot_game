extends Node2D

var PotionsStatus = {
	'poison' : 10,
	'powerUp': 5
}


func _on_detection_area_poison_potion_body_entered(body: Node2D) -> void:
	if(bodyIsPlayer(body)):
		var newLifePlayer = PlayerStatus.life - PotionsStatus['poison']	
		PlayerStatus.life = newLifePlayer
		
	


func _on_detection_area_powerUp_potion_body_entered(body: Node2D) -> void:
	if(bodyIsPlayer(body)):
		var newPowerPlayer = PlayerStatus.power + PotionsStatus['powerUp']	
		PlayerStatus.power = newPowerPlayer
		
	
	
func bodyIsPlayer(body: Node2D) -> bool: return body.is_in_group('Player')
