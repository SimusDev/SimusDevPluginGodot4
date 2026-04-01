class_name SimusNetTransportConfig
extends Resource

@export var enabled: bool = true
@export var max_packets_per_batch: int = 12
@export var compression_enabled: bool = true
@export var compression_threshold_deflate: int = 512
@export var compression_threshold_zstd: int = 4096
@export var tickrate: float = 60.0
