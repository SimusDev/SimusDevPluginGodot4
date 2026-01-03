extends SimusNetSingletonChild
class_name SimusNetVisibility

static var _queue_create: Array[SimusNetIdentity] = []
static var _queue_delete: Array[SimusNetIdentity] = []

static var _instance: SimusNetVisibility

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

static func _local_identity_create(identity: SimusNetIdentity) -> void:
	_queue_create.append(identity)

static func _local_identity_delete(identity: SimusNetIdentity) -> void:
	_queue_delete.append(identity)

static func _serialize_array(array: Array[SimusNetIdentity]) -> void:
	pass

static func _deserialize_array(array: Array[PackedByteArray]) -> void:
	pass
