extends AudioStreamPlayer2D

func change_music(music: AudioStream) -> void:
	stream = music
	play()
