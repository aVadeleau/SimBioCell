tool
extends Spatial

export(bool) var GenerateMesh : bool = false setget _generate_mesh
export(bool) var GenerateCollider : bool = false setget _generate_collider
export(Vector2) var MeshSize = Vector2(100.0, 100.0) 
export(Material) var MeshMaterial
export(float) var NoisePeriod : float = 80.0 
export(float) var Noisiness : float = 6.0
export(float) var NoiseAmplitude : float = 20.0 
export(float) var Subdivision = 1.0

func _ready():
	_generate_mesh(false)
	_generate_collider(false)

func _generate_mesh(_arg):
	var noise = OpenSimplexNoise.new()
	noise.period = NoisePeriod
	noise.octaves = Noisiness 
	
	var plane_mesh = PlaneMesh.new()
	plane_mesh.size = MeshSize
	plane_mesh.subdivide_depth = Subdivision * MeshSize.y
	plane_mesh.subdivide_width = Subdivision * MeshSize.x
	
	var surface_tool = SurfaceTool.new()
	surface_tool.create_from(plane_mesh, 0)
	
	var array_plane = surface_tool.commit()
	
	var data_tool = MeshDataTool.new()
	
	data_tool.create_from_surface(array_plane, 0)
	
	for i in range(data_tool.get_vertex_count()):
		var vert = data_tool.get_vertex(i)
		vert.y = noise.get_noise_3d(global_transform.origin.x + vert.x, global_transform.origin.y + vert.y, global_transform.origin.z + vert.z) * NoiseAmplitude
		
		data_tool.set_vertex(i, vert)
		
	for i in range(array_plane.get_surface_count()):
		array_plane.surface_remove(i)
		
	data_tool.commit_to_surface(array_plane)
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	surface_tool.create_from(array_plane, 0)
	surface_tool.generate_normals()
	
	var mesh_instance = get_child(0)
	mesh_instance.mesh = surface_tool.commit()
	mesh_instance.set_surface_material(0, MeshMaterial)
	GenerateMesh = false

func _generate_collider(_arg):
	var mesh_instance = get_child(0)
	var collider_instance = get_child(1)
	
	collider_instance.shape = mesh_instance.mesh.create_trimesh_shape()
	GenerateCollider = false
