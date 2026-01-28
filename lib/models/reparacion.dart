class Reparacion {
  final int id;
  final String titulo;
  final String descripcion;
  final int duracion; // minutos
  final double coste;
  final int tallerId;
  final int telefonoId;
  final int tecnicoId;
  final String fechaIngreso;
  final String fechaEntrega;
  final String estado;

  Reparacion({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.duracion,
    required this.coste,
    required this.tallerId,
    required this.telefonoId,
    required this.tecnicoId,
    required this.fechaIngreso,
    required this.fechaEntrega,
    required this.estado,
  });

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null) return parsed;
    }
    return null;
  }

  factory Reparacion.fromJson(Map<String, dynamic> json) {
    // La API no está devolviendo 'titulo' ni 'duracion' en el JSON
    // Intentar buscar en diferentes lugares posibles
    final tituloValue = json['titulo'] as String? ?? 
                       (json['talleres'] is Map ? json['talleres']['titulo'] : null) as String? ?? 
                       '';
    
    final duracionValue = _parseInt(json['duracion']) ?? 
                _parseInt(json['duracion_minutos']) ?? 
                _parseInt(json['duracion_min']) ?? 
                _parseInt(json['tiempo']) ?? 0;
    
    return Reparacion(
      id: json['id'] as int? ?? 0,
      titulo: tituloValue,
      descripcion: json['descripcion'] as String? ?? '',
      duracion: duracionValue, // La API no está devolviendo este campo
      coste: (json['costo'] as num?)?.toDouble() ?? (json['coste'] as num?)?.toDouble() ?? 0.0,
      tallerId: json['taller_id'] as int? ?? 0,
      telefonoId: json['telefono_id'] as int? ?? 0,
      tecnicoId: json['tecnico_id'] as int? ?? 0,
      fechaIngreso: json['fecha_ingreso'] as String? ?? '',
      fechaEntrega: json['fecha_entrega'] as String? ?? '',
      estado: json['estado'] as String? ?? 'pendiente',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'duracion': duracion,
      'coste': coste,
      'taller_id': tallerId,
      'telefono_id': telefonoId,
      'tecnico_id': tecnicoId,
      'fecha_ingreso': fechaIngreso,
      'fecha_entrega': fechaEntrega,
      'estado': estado,
    };
  }

  @override
  String toString() {
    return 'Reparacion(id: $id, titulo: $titulo, coste: $coste, duracion: $duracion, estado: $estado)';
  }
}
