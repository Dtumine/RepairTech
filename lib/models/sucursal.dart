class Sucursal {
  final int id;
  final String nombre;
  final String direccion;
  final String telefono;
 
  Sucursal({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.telefono,
  });

  factory Sucursal.fromJson(Map<String, dynamic> json) {
    return Sucursal(
      id: json['id'] as int? ?? 0,
      nombre: json['nombre'] as String? ?? '',
      direccion: json['direccion'] as String? ?? '',
      telefono: json['telefono'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'direccion': direccion,
      'telefono': telefono,
    };
  }

  @override
  String toString() {
    return 'Sucursal(id: $id, nombre: $nombre, direccion: $direccion, telefono: $telefono)';
  }
}
