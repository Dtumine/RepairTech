class Cliente {
  final int id;
  final String nombre;
  final String telefono;
  final String direccion;
  final String email;

  Cliente({
    required this.id,
    required this.nombre,
    required this.telefono,
    required this.direccion,
    required this.email,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'] as int? ?? 0,
      nombre: json['nombre'] as String? ?? '',
      telefono: json['telefono'] as String? ?? '',
      direccion: json['direccion'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'telefono': telefono,
      'direccion': direccion,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'Cliente(id: $id, nombre: $nombre, telefono: $telefono, direccion: $direccion, email: $email)';
  }
}
