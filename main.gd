extends Node2D

#resolution sizes
var x_res = 1080
var y_res = 1920


func _ready() -> void:
	pass

func _process(delta: float) -> void:	
	pass
	
func buttonpress():
	print("pressed")

func create_faces() -> void:
	var happy_label = $HappyLabel
	var sad_label = $SadLabel
	
	var total_happy = 0
	var total_sad = 0
	
	var faces_generated = randi_range(1, 10)

	for i in range(faces_generated):
		#random atribues for each face
		var eyes = randi_range(2, 6)
		var radius = randi_range(20, 150)
		var pos = Vector2(randi_range(200, y_res - radius),randi_range(200, x_res - radius))
		var face_type = randi_range(1, 2)
		var random_face_color = Color8(randi_range(1,250),randi_range(1,250),randi_range(1,250))
		
	
		
		#happy faces
		if face_type == 1:
			total_happy = total_happy + 1
			
			#Face
			draw_circle(pos, radius, random_face_color)
			
			#Mouth
			var point1 = Vector2(pos[0] - (radius/2.5),pos[1] + (radius/2))
			var point2 = Vector2(pos[0] + (radius/2.5),pos[1] + (radius/2))
			var random_line_color = Color8(randi_range(1,250),randi_range(1,250),randi_range(1,250))
			draw_line(point1, point2, random_line_color, 5)
			
			var point3 = Vector2(pos[0] - (radius/2), pos[1] - (radius/15))
			draw_line(point1, point3, random_line_color, 5)
			
			var point4 = Vector2(pos[0] + (radius/2), pos[1] - (radius/15))
			draw_line(point2, point4, random_line_color, 5)
			
			var nose_pos = Vector2(pos[0], pos[1])
			draw_circle(nose_pos, radius/10, random_line_color)
			
			#eyes
			for j in range(eyes):
				var eye_distance = radius/eyes
				var eye_pos = Vector2((pos[0] - (radius / 2)) + (eye_distance*j), pos[1] - (radius/2.5))
				draw_circle(eye_pos, radius/10, random_line_color)
				pass
			
		#sad faces
		elif face_type == 2:
			total_sad = total_sad + 1
			
			#Face
			draw_circle(pos, radius, random_face_color)
			
			#Mouth
			var point1 = Vector2(pos[0] - (radius/2.5),pos[1] + (radius/2))
			var point2 = Vector2(pos[0] + (radius/2.5),pos[1] + (radius/2))
			var random_line_color = Color8(randi_range(1,250),randi_range(1,250),randi_range(1,250))
			draw_line(point1, point2, random_line_color, 5)
			
			var point3 = Vector2(pos[0] - (radius/2), point1[1] + (radius/15))
			draw_line(point1, point3, random_line_color, 5)
			
			var point4 = Vector2(pos[0] + (radius/2), point2[1] + (radius/15))
			draw_line(point2, point4, random_line_color, 5)
			
			var nose_pos = Vector2(pos[0], pos[1])
			draw_circle(nose_pos, radius/10, random_line_color)
			
			#eyes
			for j in range(eyes):
				var eye_distance = radius/eyes
				var eye_pos = Vector2((pos[0] - (radius / 2)) + (eye_distance*j), pos[1] - (radius/2.5))
				draw_circle(eye_pos, radius/10, random_line_color)
				pass
				
	sad_label.text = "Sad faces: " + str(total_sad)
	happy_label.text = "Happy faces: " + str(total_happy)
	


func _draw() -> void:
	create_faces()


func _on_button_pressed() -> void:
	queue_redraw()
