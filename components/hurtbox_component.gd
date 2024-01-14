class_name HurtboxComponent
extends Area2D

var is_invincible := false:
	set(value):
		is_invincible = value

		for child in get_children():
			if child is CollisionShape2D or child is CollisionPolygon2D:
				child.set_deferred("disabled", is_invincible)

signal hurt(hitbox: HitboxComponent)