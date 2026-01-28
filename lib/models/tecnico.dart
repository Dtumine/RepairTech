class Tecnico {
  final int id;
  final String nombre;
  final String especialidad;
  final String telefono;
  final int tallerId;

  Tecnico({
    required this.id,
    required this.nombre,
    required this.especialidad,
    required this.telefono,
    required this.tallerId,
  });

  factory Tecnico.fromJson(Map<String, dynamic> json) {
    return Tecnico(
      id: json['id'] as int? ?? 0,
      nombre: json['nombre'] as String? ?? '',
      especialidad: json['especialidad'] as String? ?? '',
      telefono: json['telefono'] as String? ?? '',
      tallerId: json['taller_id'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'especialidad': especialidad,
      'telefono': telefono,
      'taller_id': tallerId,
    };
  }

  @override
  String toString() {
    return 'Tecnico(id: $id, nombre: $nombre, especialidad: $especialidad, telefono: $telefono, tallerId: $tallerId)';
  }
}
