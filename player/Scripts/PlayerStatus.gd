extends Node


#Script GD para armazenar as informações do player de forma global

var life =  100
var power = 15



func thisBodyIsPlayer(body: Node2D): return body.is_in_group('Player')
