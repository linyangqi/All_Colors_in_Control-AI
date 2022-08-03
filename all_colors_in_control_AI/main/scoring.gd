extends Node

var score := 0
var kills := 0
var ship_counts = [0,0,0,0]


func update_ship_count():
	$UI.update_ship_count(ship_counts)
	$MusicDJ.update_music(ship_counts)


func _on_ship_enemy_die(ship_type):
	if $Player:
		score += 10
		kills += 1
		$UI.update_score(score)
		$UI.update_kills(kills)
	
	ship_counts[ship_type] -=1
	update_ship_count()


func _on_Player_player_die():
	$SummonerArrange.queue_free()



func _on_ScoreTimer_timeout():
	if $Player:
		score += 1
		for count in ship_counts:
			score += count
			$UI.update_score(score)
