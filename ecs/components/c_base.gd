class_name BaseComponent extends Node

func _ready() -> void:
	ECSManager.register(self)
	pass

func _process(delta: float) -> void:
	
	pass

func _physics_process(delta: float) -> void:
	print(ECSManager.get_comp(BaseComponent))
	pass

func _exit_tree() -> void:
	ECSManager.unregister(self)
	pass
