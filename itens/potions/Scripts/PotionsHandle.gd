extends Node2D

var PotionsStatus = {
	'poison' : 10,
	'powerUp': 5
}


func _on_detection_area_poison_potion_body_entered(body: Node2D) -> void:
	if(bodyIsPlayer(body)):
		print('Player', 'entrou no veneno')
		var newLifePlayer = PlayerStatus.life - PotionsStatus['poison']	
		PlayerStatus.life = newLifePlayer
		
		print('Essa é a vida atual do player: ', PlayerStatus.life)
	


func _on_detection_area_powerUp_potion_body_entered(body: Node2D) -> void:
	if(bodyIsPlayer(body)):
		print('Player', 'entrou na pocao de poder')
		var newPowerPlayer = PlayerStatus.power + PotionsStatus['powerUp']	
		PlayerStatus.power = newPowerPlayer
		
		print('Esse é o novo poder do player', PlayerStatus.power)
	
	
func bodyIsPlayer(body: Node2D) -> bool: return body.is_in_group('Player')
