extends Node

func create_area(obj, name):
	#Verification si l'objet a déjà ou non une zone de detection
	var alreadyCreated = false
	for child in obj.get_children():
		if child.get_name() == name:
			alreadyCreated = true
	if !alreadyCreated :
		var area = Area.new()
		area.set_name(name) 
		var collision = CollisionShape.new()
		var shape = SphereShape.new()
		collision.set_shape(shape)
		area.add_child(collision)
		obj.add_child(area)

func run(agent : Object, areaName : String, fromGroup : String, groupToDetect : String , zoneLength : float):
	#init des returns
	var objectToDetect = null
	var hasDetected = false
	
	if agent.is_in_group(fromGroup):
		#Création de la zone de détection pour l'objet
		create_area(agent, areaName)
		
		#Récupération de l'area qui sert de detection pour l'objet
		var id_area = 0
		var i = 0

		for child in agent.get_children():
			if child.get_name() == areaName:
				id_area = i
			i += 1
		
		#Changement de la porté de la zone de detection
		var newZone = Vector3(zoneLength,zoneLength,zoneLength)
		agent.get_child(id_area).set_scale(newZone)
				
		#Récupération des corps qui rentre en contact avec la zone
		var areaDetection = agent.get_child(id_area).get_overlapping_bodies()
		
		#Si la récupération renvoi au moin 1 valeur
		if areaDetection.size() > 0:
			#On va chercher l'objet qui se trouve dans le group a detecter
			var objectDetected = areaDetection[0]
			if !objectDetected.is_in_group(groupToDetect):
				i = 1
				while !objectDetected.is_in_group(groupToDetect) && i < areaDetection.size():
					objectDetected = areaDetection[i]
					i += 1
				
				#Si l'objet renvoyer est bien dans le group opposé alors on renvoi true sinon false
				if objectDetected.is_in_group(groupToDetect):
					objectToDetect = objectDetected
					hasDetected = true
				else:
					objectToDetect = null
					hasDetected = false
			else:
				hasDetected = true
				objectToDetect = objectDetected
		else:
			hasDetected = false
	else:
		hasDetected = false
	return [hasDetected, objectToDetect]
