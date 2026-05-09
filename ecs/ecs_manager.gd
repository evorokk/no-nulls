class_name MainECSManager extends Node
var _cache: Dictionary = {}
var _to_delete: Array = []

func register(comp: Node) -> void:
	var t = comp.get_script()
	if not _cache.has(t): _cache[t] = []
	_cache[t].append(comp)

func unregister(comp: Node) -> void:
	var t = comp.get_script()
	if _cache.has(t): _cache[t].erase(comp)

func get_comp(type: Script) -> Array:
	return _cache.get(type, []).duplicate()

func mark_delete(entity: Node) -> void:
	if not _to_delete.has(entity): _to_delete.append(entity)

func flush() -> void:
	for e in _to_delete:
		if is_instance_valid(e): e.queue_free()
	_to_delete.clear()
