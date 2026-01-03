extends SimusNetSingletonChild
class_name SimusNetRPCGodot

static func register(callables: Array[Callable], 
rpc_mode: MultiplayerAPI.RPCMode = MultiplayerAPI.RPCMode.RPC_MODE_AUTHORITY,
transfer_mode: MultiplayerPeer.TransferMode = MultiplayerPeer.TransferMode.TRANSFER_MODE_RELIABLE,
channel: int = 0) -> void:
	
	var config: Dictionary = {
		"rpc_mode" : rpc_mode,
		"transfer_mode" : transfer_mode,
		"call_local" : false,
		"channel" : channel
	}
	
	for callable in callables:
		var object: Object = callable.get_object()
		if object is Node:
			object.rpc_config(callable.get_method(), config)

static func invoke(callable: Callable, ...args: Array) -> void:
	_invoke(callable, args)

static func _invoke(callable: Callable, args: Array) -> void:
	var arr: Array = []
	arr.append(callable.get_method())
	arr.append_array(args)
	callable.get_object().callv("rpc", arr)

static func invoke_all(callable: Callable, ...args: Array) -> void:
	callable.callv(args)
	_invoke(callable, args)

static func _invoke_on(peer: int, callable: Callable, args: Array) -> void:
	if peer == SimusNetConnection.get_unique_id() or peer == 0:
		callable.callv(args)
		return
	
	var arr: Array = []
	arr.append(peer)
	arr.append(callable.get_method())
	arr.append_array(args)
	callable.get_object().callv("rpc_id", arr)

static func invoke_on(peer: int, callable: Callable, ...args: Array) -> void:
	_invoke_on(peer, callable, args)

static func invoke_on_server(callable: Callable, ...args: Array) -> void:
	_invoke_on(SimusNetConnection.SERVER_ID, callable, args)
