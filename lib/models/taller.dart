class Taller {
  final int id;
  final String nombre;
  final String especialidad;
  final int sucursalId;

  Taller({
    required this.id,
    required this.nombre,
    required this.especialidad,
    required this.sucursalId,
  });

  factory Taller.fromJson(Map<String, dynamic> json) {
    return Taller(
      id: json['id'] as int? ?? 0,
      nombre: json['nombre'] as String? ?? '',
      especialidad: json['especialidad'] as String? ?? '',
      sucursalId: json['sucursal_id'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'especialidad': especialidad,
      'sucursal_id': sucursalId,
    };
  }

  @override
  String toString() {
    return 'Taller(id: $id, nombre: $nombre, especialidad: $especialidad, sucursalId: $sucursalId)';
  }
}
