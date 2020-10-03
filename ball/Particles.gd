extends Node2D

var particles := []
var particles_number := 50


func _ready() -> void:
    particles = initialize_particles()


func _draw() -> void:
    for particle in particles:
        draw_circle(particle[0], particle[2], particle[3])


func _process(delta: float) -> void:
    update_particles(delta)
    update()


func initialize_particles() -> Array:
    var p_array := []

    for n in range(particles_number):
        p_array.append(new_particle())

    return p_array


func update_particles(delta: float) -> void:
    for i in range(particles.size()):
        particles[i][0] += particles[i][1] * delta
        particles[i][3] = Color(255.0, 0.0, 0.0, particles[i][3][3] * 0.9)
        particles[i][4] -= delta * 50
        if particles[i][4] < 0:
            particles[i] = new_particle()


func new_particle() -> Array:
    var parameters := []
    var size := 3
    var lifetime := rand_range(10.0, 200.0)
    var rand_dir_x := rand_range(0.8, 1.0)
    var rand_dir_y := rand_range(0.8, 1.0)
    var position : Vector2 = get_parent().get_node("Ball").position
    var velocity : Vector2 = get_parent().get_node("Ball").ball_velocity * 0.8
    velocity.x *= rand_dir_x
    velocity.y *= rand_dir_y
    var color := Color(255.0, 0.0, 0.0, 1)

    parameters.append(position)
    parameters.append(velocity)
    parameters.append(size)
    parameters.append(color)
    parameters.append(lifetime)

    return parameters
