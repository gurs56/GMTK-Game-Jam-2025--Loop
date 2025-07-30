@tool
extends Node3D

func _ready():
	var out_dir: String = "res://assets/Metro_PSX/Metro_PSX/Models/Metro_slipt/"

	if not DirAccess.dir_exists_absolute(out_dir):
		DirAccess.make_dir_absolute(out_dir)

	for child in get_children():
		var mesh: MeshInstance3D = null

		if child is MeshInstance3D:
			mesh = child
		elif child.get_child_count() > 0:
			# Try to get the first MeshInstance3D inside the child
			for grandchild in child.get_children():
				if grandchild is MeshInstance3D:
					mesh = grandchild
					break

		if mesh != null:
			var single_mesh_node: MeshInstance3D = mesh.duplicate() as MeshInstance3D
			single_mesh_node.name = child.name

			var packed: PackedScene = PackedScene.new()
			if packed.pack(single_mesh_node) == OK:
				var save_path: String = out_dir + child.name + ".tscn"
				var result := ResourceSaver.save(packed, save_path)
				if result == OK:
					print("✅ Saved:", save_path)
				else:
					print("❌ Save failed for:", child.name)
			else:
				print("⚠️ Could not pack mesh for:", child.name)
		else:
			print("⚠️ No mesh found in:", child.name)
