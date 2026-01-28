class Telefono {
  final int id;
  final String marca;
  final String modelo;
  final int clienteId;
  final String imei;

  Telefono({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.clienteId,
    required this.imei,
  });

  factory Telefono.fromJson(Map<String, dynamic> json) {
    return Telefono(
      id: json['id'] as int? ?? 0,
      marca: json['marca'] as String? ?? '',
      modelo: json['modelo'] as String? ?? '',
      clienteId: json['cliente_id'] as int? ?? 0,
      imei: json['imei'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'cliente_id': clienteId,
      'imei': imei,
    };
  }

  @override
  String toString() {
    return 'Telefono(id: $id, marca: $marca, modelo: $modelo, clienteId: $clienteId, imei: $imei)';
  }
}
