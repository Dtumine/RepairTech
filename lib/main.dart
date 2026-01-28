import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'models/sucursal.dart';
import 'models/taller.dart';
import 'models/cliente.dart';
import 'models/tecnico.dart';
import 'models/telefono.dart';
import 'models/reparacion.dart'; 


// flutter run -d chrome --web-browser-flag="--disable-web-security"


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RepairTech',
      theme: ThemeData(
        useMaterial3: true,
        // Color de base: negro
        scaffoldBackgroundColor: Colors.black,
        // Colores primarios: naranja
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.dark(
          primary: Colors.orange,
          secondary: Colors.red,
          surface: Colors.grey[900]!,
          background: Colors.black,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
        ),
        // AppBar theme
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        // Tipografía moderna
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.25,
          ),
          displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyMedium: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          bodySmall: TextStyle(
            color: Colors.white60,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          labelMedium: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
          labelSmall: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        // Card theme
        cardTheme: CardThemeData(
          color: Colors.grey[900],
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // ElevatedButton theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        // TextButton theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        // Input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[700]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[700]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.orange, width: 2),
          ),
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        // Icon theme
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        // FloatingActionButton theme
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RepairTech'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const Icon(
              Icons.build_circle,
              size: 80,
              color: Colors.orange,
            ),
            const SizedBox(height: 32),
            const Text(
              'Sistema de Gestión',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 48),
            _buildMenuCard(
              context,
              icon: Icons.store,
              title: 'Sucursales',
              subtitle: 'Ver todas las sucursales',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SucursalesPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuCard(
              context,
              icon: Icons.hardware,
              title: 'Talleres',
              subtitle: 'Ver todos los talleres',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TalleresPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuCard(
              context,
              icon: Icons.person,
              title: 'Clientes',
              subtitle: 'Ver todos los clientes',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClientesPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuCard(
              context,
              icon: Icons.engineering,
              title: 'Técnicos',
              subtitle: 'Ver todos los técnicos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TecnicosPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuCard(
              context,
              icon: Icons.phone_android,
              title: 'Teléfonos',
              subtitle: 'Ver todos los teléfonos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelefonosPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuCard(
              context,
              icon: Icons.build,
              title: 'Reparaciones',
              subtitle: 'Ver todas las reparaciones',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReparacionesPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildMenuCard(
              context,
              icon: Icons.dashboard,
              title: 'Todas las Entidades',
              subtitle: 'Ver todas las entidades con sus relaciones',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TodasLasEntidadesPage()),
                );
              },
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: Colors.deepOrange),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SucursalesPage extends StatefulWidget {
  const SucursalesPage({super.key});

  @override
  State<SucursalesPage> createState() => _SucursalesPageState();
}

class _SucursalesPageState extends State<SucursalesPage> {
  late Future<List<Sucursal>> _sucursalesFuture;
  List<Taller>? _talleres;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';
  Timer? _debounceTimer;
  String? _selectedLetter;
  final Map<String, GlobalKey> _sectionKeys = {};

  @override
  void initState() {
    super.initState();
    _sucursalesFuture = fetchSucursales();
    _loadTalleres();
    _searchController.addListener(_onSearchChanged);
  }

  Future<void> _loadTalleres() async {
    try {
      final talleres = await fetchTalleres();
      setState(() {
        _talleres = talleres;
      });
    } catch (e) {
      debugPrint('Error al cargar talleres: $e');
    }
  }

  Future<List<Taller>> fetchTalleres() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/talleres'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Taller> talleres = [];
        for (var json in jsonList) {
          try {
            talleres.add(Taller.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear taller: $e, JSON: $json');
          }
        }
        return talleres;
      } else {
        throw Exception("Error al cargar talleres: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error al cargar talleres: ${e.toString()}');
    }
  }

  List<Taller> _getTalleresPorSucursal(int sucursalId) {
    return _talleres?.where((t) => t.sucursalId == sucursalId).toList() ?? [];
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // Debounce: esperar 300ms antes de filtrar
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _searchQuery = _searchController.text.toLowerCase();
        });
      }
    });
  }

  void _scrollToSection(String letter) {
    final key = _sectionKeys[letter];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _selectedLetter = letter;
      });
      // Ocultar el indicador después de 1 segundo
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _selectedLetter = null;
          });
        }
      });
    }
  }

  Future<List<Sucursal>> fetchSucursales() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/sucursales'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado. Verifica la conexión a internet y que la API esté disponible en $baseUrl');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Sucursal> sucursales = [];
        for (var json in jsonList) {
          try {
            sucursales.add(Sucursal.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear sucursal: $e, JSON: $json');
          }
        }
        return sucursales;
      } else {
        throw Exception("Error al cargar sucursales: ${response.statusCode}");
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception(
          'Error de CORS: La API no permite solicitudes desde el navegador.\n\n'
          'Solución: Ejecuta la app en modo móvil o desktop:\n'
          '• flutter run -d windows (Windows)\n'
          '• flutter run -d macos (macOS)\n'
          '• flutter run -d linux (Linux)\n'
          '• flutter run -d chrome --web-browser-flag="--disable-web-security" (Solo desarrollo)'
        );
      }
      
      if (errorString.contains('Connection refused') || 
          errorString.contains('ERR_CONNECTION_RESET') ||
          errorString.contains('Failed host lookup') ||
          errorString.contains('ERR_FAILED')) {
        throw Exception('No se puede conectar al servidor. Verifica tu conexión a internet y que la API esté disponible en $baseUrl');
      }
      rethrow;
    }
  }

  Future<bool> crearSucursal(String nombre, String direccion, String telefono) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/sucursales'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'nombre': nombre,
          'direccion': direccion,
          'telefono': telefono,
        }),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        // Intentar obtener el mensaje de error del servidor
        String errorMessage = 'Error al crear sucursal: ${response.statusCode}';
        try {
          final errorBody = jsonDecode(response.body);
          if (errorBody is Map && errorBody.containsKey('message')) {
            errorMessage = 'Error: ${errorBody['message']}';
          } else if (errorBody is Map && errorBody.containsKey('error')) {
            errorMessage = 'Error: ${errorBody['error']}';
          } else {
            errorMessage = 'Error ${response.statusCode}: ${response.body}';
          }
        } catch (_) {
          // Si no se puede parsear el error, usar el código de estado
          errorMessage = 'Error ${response.statusCode}: ${response.body}';
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al crear sucursal');
      }
      rethrow;
    }
  }

  void _mostrarDialogoAgregarSucursal() {
    final nombreController = TextEditingController();
    final direccionController = TextEditingController();
    final telefonoController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final scaffoldContext = context; // Guardar el contexto del Scaffold

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Agregar Nueva Sucursal'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nombreController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.store),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: direccionController,
                    decoration: const InputDecoration(
                      labelText: 'Dirección',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la dirección';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: telefonoController,
                    decoration: const InputDecoration(
                      labelText: 'Teléfono',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el teléfono';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  Navigator.of(dialogContext).pop();
                  
                  // Verificar que el widget todavía está montado antes de continuar
                  if (!mounted) return;
                  
                  // Mostrar indicador de carga usando el contexto del Scaffold
                  showDialog(
                    context: scaffoldContext,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    ),
                  );

                  try {
                    final exito = await crearSucursal(
                      nombreController.text.trim(),
                      direccionController.text.trim(),
                      telefonoController.text.trim(),
                    );

                    // Verificar que el widget todavía está montado antes de usar el contexto
                    if (!mounted) return;
                    
                    Navigator.of(scaffoldContext).pop(); // Cerrar indicador de carga

                    if (exito) {
                      // Mostrar mensaje de éxito
                      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                        const SnackBar(
                          content: Text('Sucursal creada exitosamente'),
                          backgroundColor: Colors.orange,
                        ),
                      );
                      // Recargar la lista para mostrar la nueva sucursal
                      setState(() {
                        _sucursalesFuture = fetchSucursales();
                      });
                    }
                  } catch (e) {
                    // Verificar que el widget todavía está montado antes de usar el contexto
                    if (!mounted) return;
                    
                    Navigator.of(scaffoldContext).pop(); // Cerrar indicador de carga
                    // Mostrar mensaje de error
                    ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                      SnackBar(
                        content: Text('Error al crear sucursal: ${e.toString()}'),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 4),
                      ),
                    );
                  }
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.orange),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Buscar sucursales por nombre, dirección o teléfono...",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.orange, width: 2),
          ),
          filled: true,
          fillColor: Colors.grey[900],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Sucursales"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarDialogoAgregarSucursal,
            tooltip: 'Agregar sucursal',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarSucursal,
        child: const Icon(Icons.add),
        tooltip: 'Agregar sucursal',
      ),
      body: FutureBuilder<List<Sucursal>>(
        future: _sucursalesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.orange));
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      "Error al cargar datos",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _sucursalesFuture = fetchSucursales();
                        });
                      },
                      child: const Text("Reintentar"),
                    ),
                  ],
                ),
              ),
            );
          }

          final sucursales = snapshot.data!;

          if (sucursales.isEmpty) {
            return const Center(
              child: Text("No hay sucursales disponibles"),
            );
          }

          // Filtrar sucursales según la búsqueda
          final sucursalesFiltradas = _searchQuery.isEmpty
              ? sucursales
              : sucursales.where((s) {
                  return s.nombre.toLowerCase().contains(_searchQuery) ||
                      s.direccion.toLowerCase().contains(_searchQuery) ||
                      s.telefono.contains(_searchQuery);
                }).toList();

          // Agrupar por letra inicial
          final Map<String, List<Sucursal>> sucursalesAgrupadas = {};
          for (var sucursal in sucursalesFiltradas) {
            final inicial = sucursal.nombre.isNotEmpty
                ? sucursal.nombre[0].toUpperCase()
                : '#';
            if (!sucursalesAgrupadas.containsKey(inicial)) {
              sucursalesAgrupadas[inicial] = [];
            }
            sucursalesAgrupadas[inicial]!.add(sucursal);
          }

          // Ordenar las letras
          final letrasOrdenadas = sucursalesAgrupadas.keys.toList()..sort();
          
          // Ordenar cada grupo alfabéticamente
          for (var letra in letrasOrdenadas) {
            sucursalesAgrupadas[letra]!.sort((a, b) => 
                a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase()));
          }

          if (sucursalesFiltradas.isEmpty) {
            return Column(
              children: [
                _buildSearchBar(),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          "No se encontraron sucursales",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Intenta con otros términos de búsqueda",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return Container(
            color: Colors.black,
            child: Column(
              children: [
                _buildSearchBar(),
              // Indicador de resultados
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.infinity,
                color: Colors.black,
                child: Text(
                  _searchQuery.isEmpty
                      ? "Total: ${sucursalesFiltradas.length} sucursales"
                      : "${sucursalesFiltradas.length} resultado${sucursalesFiltradas.length != 1 ? 's' : ''} de ${sucursales.length}",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // Nota discreta sobre ordenamiento alfabético
              if (_searchQuery.isEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  width: double.infinity,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 14,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Ordenadas alfabéticamente',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              // Lista agrupada con scroll rápido
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      controller: _scrollController,
                      itemCount: letrasOrdenadas.length,
                      itemBuilder: (context, index) {
                        final letra = letrasOrdenadas[index];
                        final sucursalesLetra = sucursalesAgrupadas[letra]!;
                        
                        // Crear key para esta sección si no existe
                        if (!_sectionKeys.containsKey(letra)) {
                          _sectionKeys[letra] = GlobalKey();
                        }
                        
                        return Column(
                          key: _sectionKeys[letra],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        // Items de la letra
                        ...sucursalesLetra.map((sucursal) {
                          final talleresSucursal = _getTalleresPorSucursal(sucursal.id);
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: ExpansionTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Text(
                                  sucursal.id.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(
                                sucursal.nombre,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          size: 14, color: Colors.grey[400]),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          sucursal.direccion,
                                          style: const TextStyle(fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Icon(Icons.phone,
                                          size: 14, color: Colors.grey[400]),
                                      const SizedBox(width: 4),
                                      Text(
                                        sucursal.telefono,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Información de la Sucursal',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      _buildDetailRow(
                                        Icons.store,
                                        'Nombre',
                                        sucursal.nombre,
                                      ),
                                      const SizedBox(height: 8),
                                      _buildDetailRow(
                                        Icons.location_on,
                                        'Dirección',
                                        sucursal.direccion,
                                      ),
                                      const SizedBox(height: 8),
                                      _buildDetailRow(
                                        Icons.phone,
                                        'Teléfono',
                                        sucursal.telefono,
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Talleres asociados:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      if (talleresSucursal.isEmpty)
                                        const Text(
                                          'No hay talleres asociados',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        )
                                      else
                                        ...talleresSucursal.map((taller) => Padding(
                                          padding: const EdgeInsets.only(left: 16, top: 4),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.hardware,
                                                size: 16,
                                                color: Colors.orange,
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  '• ${taller.nombre} - Especialidad: ${taller.especialidad}',
                                                  style: const TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                          ],
                        );
                      },
                    ),
                    // Scroll rápido lateral (Jump List) - solo si no hay búsqueda activa
                    if (_searchQuery.isEmpty && letrasOrdenadas.length > 3)
                      Positioned(
                        right: 4,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: letrasOrdenadas.map((letra) {
                                final isSelected = _selectedLetter == letra;
                                return GestureDetector(
                                  onTap: () => _scrollToSection(letra),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.orange
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      letra,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.orange,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    // Indicador visual de letra seleccionada
                    if (_selectedLetter != null)
                      Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              _selectedLetter!,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
            ),
          );
        },
      ),
    );
  }
}

class TalleresPage extends StatefulWidget {
  const TalleresPage({super.key});

  @override
  State<TalleresPage> createState() => _TalleresPageState();
}

class _TalleresPageState extends State<TalleresPage> {
  late Future<List<Taller>> _talleresFuture;

  @override
  void initState() {
    super.initState();
    _talleresFuture = fetchTalleres();
  }

  Future<List<Taller>> fetchTalleres() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/talleres'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado. Verifica la conexión a internet y que la API esté disponible en $baseUrl');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Taller> talleres = [];
        for (var json in jsonList) {
          try {
            talleres.add(Taller.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear taller: $e, JSON: $json');
          }
        }
        return talleres;
      } else {
        throw Exception("Error al cargar talleres: ${response.statusCode}");
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception(
          'Error de CORS: La API no permite solicitudes desde el navegador.\n\n'
          'Solución: Ejecuta la app en modo móvil o desktop:\n'
          '• flutter run -d windows (Windows)\n'
          '• flutter run -d macos (macOS)\n'
          '• flutter run -d linux (Linux)\n'
          '• flutter run -d chrome --web-browser-flag="--disable-web-security" (Solo desarrollo)'
        );
      }
      
      if (errorString.contains('Connection refused') || 
          errorString.contains('ERR_CONNECTION_RESET') ||
          errorString.contains('Failed host lookup') ||
          errorString.contains('ERR_FAILED')) {
        throw Exception('No se puede conectar al servidor. Verifica tu conexión a internet y que la API esté disponible en $baseUrl');
      }
      rethrow;
    }
  }

  Future<Sucursal?> fetchSucursal(int sucursalId) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/sucursales/$sucursalId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Sucursal.fromJson(json as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<Sucursal>> fetchSucursales() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/sucursales'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Sucursal> sucursales = [];
        for (var json in jsonList) {
          try {
            sucursales.add(Sucursal.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear sucursal: $e, JSON: $json');
          }
        }
        return sucursales;
      } else {
        throw Exception("Error al cargar sucursales: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error al cargar sucursales: ${e.toString()}');
    }
  }

  Future<bool> crearTaller(String nombre, String especialidad, int sucursalId) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/talleres'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'nombre': nombre,
          'especialidad': especialidad,
          'sucursal_id': sucursalId,
        }),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        // Intentar obtener el mensaje de error del servidor
        String errorMessage = 'Error al crear taller: ${response.statusCode}';
        try {
          final errorBody = jsonDecode(response.body);
          if (errorBody is Map && errorBody.containsKey('message')) {
            errorMessage = 'Error: ${errorBody['message']}';
          } else if (errorBody is Map && errorBody.containsKey('error')) {
            errorMessage = 'Error: ${errorBody['error']}';
          } else {
            errorMessage = 'Error ${response.statusCode}: ${response.body}';
          }
        } catch (_) {
          // Si no se puede parsear el error, usar el código de estado
          errorMessage = 'Error ${response.statusCode}: ${response.body}';
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al crear taller');
      }
      rethrow;
    }
  }

  Future<int?> _mostrarDialogoSeleccionarSucursal() async {
    final TextEditingController searchController = TextEditingController();
    String searchQuery = '';
    Timer? debounceTimer;
    String? selectedLetter;
    final ScrollController scrollController = ScrollController();
    final Map<String, GlobalKey> sectionKeys = {};
    int? sucursalSeleccionada;

    return showDialog<int>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            void onSearchChanged(String value) {
              debounceTimer?.cancel();
              debounceTimer = Timer(const Duration(milliseconds: 300), () {
                setDialogState(() {
                  searchQuery = value.toLowerCase();
                });
              });
            }

            void scrollToSection(String letter) {
              if (sectionKeys.containsKey(letter)) {
                final key = sectionKeys[letter]!;
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setDialogState(() {
                  selectedLetter = letter;
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  setDialogState(() {
                    selectedLetter = null;
                  });
                });
              }
            }

            return Dialog(
              backgroundColor: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.black,
                child: Column(
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.store, color: Colors.orange),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Seleccionar Sucursal',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(dialogContext).pop(),
                          ),
                        ],
                      ),
                    ),
                    // Barra de búsqueda
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: searchController,
                        onChanged: onSearchChanged,
                        decoration: InputDecoration(
                          hintText: "Buscar sucursales...",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    searchController.clear();
                                    setDialogState(() {
                                      searchQuery = '';
                                    });
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.orange, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.grey[900],
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          labelStyle: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    // Lista de sucursales
                    Expanded(
                      child: FutureBuilder<List<Sucursal>>(
                        future: fetchSucursales(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator(color: Colors.orange));
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error al cargar sucursales: ${snapshot.error}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }

                          final sucursales = snapshot.data ?? [];

                          if (sucursales.isEmpty) {
                            return const Center(
                              child: Text(
                                'No hay sucursales disponibles',
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }

                          // Filtrar sucursales según la búsqueda
                          final sucursalesFiltradas = searchQuery.isEmpty
                              ? sucursales
                              : sucursales.where((s) {
                                  return s.nombre.toLowerCase().contains(searchQuery) ||
                                      s.direccion.toLowerCase().contains(searchQuery) ||
                                      s.telefono.contains(searchQuery);
                                }).toList();

                          // Agrupar por letra inicial
                          final Map<String, List<Sucursal>> sucursalesAgrupadas = {};
                          for (var sucursal in sucursalesFiltradas) {
                            final inicial = sucursal.nombre.isNotEmpty
                                ? sucursal.nombre[0].toUpperCase()
                                : '#';
                            if (!sucursalesAgrupadas.containsKey(inicial)) {
                              sucursalesAgrupadas[inicial] = [];
                            }
                            sucursalesAgrupadas[inicial]!.add(sucursal);
                          }

                          // Ordenar las letras
                          final letrasOrdenadas = sucursalesAgrupadas.keys.toList()..sort();

                          // Ordenar cada grupo alfabéticamente
                          for (var letra in letrasOrdenadas) {
                            sucursalesAgrupadas[letra]!.sort((a, b) =>
                                a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase()));
                          }

                          if (sucursalesFiltradas.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                                  const SizedBox(height: 16),
                                  Text(
                                    "No se encontraron sucursales",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Stack(
                            children: [
                              ListView.builder(
                                controller: scrollController,
                                itemCount: letrasOrdenadas.length,
                                itemBuilder: (context, index) {
                                  final letra = letrasOrdenadas[index];
                                  final sucursalesLetra = sucursalesAgrupadas[letra]!;

                                  if (!sectionKeys.containsKey(letra)) {
                                    sectionKeys[letra] = GlobalKey();
                                  }

                                  return Column(
                                    key: sectionKeys[letra],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Lista de sucursales de esta letra
                                      ...sucursalesLetra.map((sucursal) {
                                        final isSelected = sucursalSeleccionada == sucursal.id;
                                        return ListTile(
                                          leading: Icon(
                                            Icons.store,
                                            color: isSelected ? Colors.orange : Colors.grey[400],
                                          ),
                                          title: Text(
                                            sucursal.nombre,
                                            style: TextStyle(
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: isSelected ? Colors.orange : Colors.white,
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                sucursal.direccion,
                                                style: const TextStyle(color: Colors.white70),
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(Icons.phone,
                                                      size: 14, color: Colors.grey[400]),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    sucursal.telefono,
                                                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          trailing: isSelected
                                              ? const Icon(Icons.check_circle, color: Colors.orange)
                                              : null,
                                          onTap: () {
                                            setDialogState(() {
                                              sucursalSeleccionada = sucursal.id;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ],
                                  );
                                },
                              ),
                              // Scroll rápido lateral
                              if (searchQuery.isEmpty && letrasOrdenadas.length > 3)
                                Positioned(
                                  right: 4,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: letrasOrdenadas.map((letra) {
                                          final isSelected = selectedLetter == letra;
                                          return GestureDetector(
                                            onTap: () => scrollToSection(letra),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? Colors.orange
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                letra,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: isSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.orange,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    // Nota discreta y botones
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          if (searchQuery.isEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 14,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Ordenadas alfabéticamente',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  child: const Text('Cancelar'),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: sucursalSeleccionada != null
                                      ? () {
                                          Navigator.of(dialogContext).pop(sucursalSeleccionada);
                                        }
                                      : null,
                                  child: const Text('Seleccionar'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _mostrarDialogoAgregarTaller() {
    final nombreController = TextEditingController();
    final especialidadController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final scaffoldContext = context;
    int? sucursalIdSeleccionado;
    String? nombreSucursalSeleccionada;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Agregar Nuevo Taller'),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: nombreController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.hardware),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el nombre';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: especialidadController,
                        decoration: const InputDecoration(
                          labelText: 'Especialidad',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.build),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la especialidad';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Selector de sucursal con búsqueda
                      InkWell(
                        onTap: () async {
                          final idSeleccionado = await _mostrarDialogoSeleccionarSucursal();
                          if (idSeleccionado != null) {
                            // Obtener el nombre de la sucursal seleccionada
                            final sucursal = await fetchSucursal(idSeleccionado);
                            setDialogState(() {
                              sucursalIdSeleccionado = idSeleccionado;
                              nombreSucursalSeleccionada = sucursal?.nombre ?? 'Sucursal seleccionada';
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.store, color: Colors.orange),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sucursal',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      nombreSucursalSeleccionada ?? 'Seleccionar sucursal',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: nombreSucursalSeleccionada != null
                                            ? Colors.black87
                                            : Colors.grey,
                                        fontWeight: nombreSucursalSeleccionada != null
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (sucursalIdSeleccionado == null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Por favor seleccione una sucursal',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate() && sucursalIdSeleccionado != null) {
                      Navigator.of(dialogContext).pop();
                      
                      if (!mounted) return;
                      
                      showDialog(
                        context: scaffoldContext,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(color: Colors.orange),
                        ),
                      );

                      try {
                        final exito = await crearTaller(
                          nombreController.text.trim(),
                          especialidadController.text.trim(),
                          sucursalIdSeleccionado!,
                        );

                        if (!mounted) return;
                        
                        Navigator.of(scaffoldContext).pop();

                        if (exito) {
                          ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                            const SnackBar(
                              content: Text('Taller creado exitosamente'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                          setState(() {
                            _talleresFuture = fetchTalleres();
                          });
                        }
                      } catch (e) {
                        if (!mounted) return;
                        
                        Navigator.of(scaffoldContext).pop();
                        ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                          SnackBar(
                            content: Text('Error al crear taller: ${e.toString()}'),
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 4),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Talleres"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarDialogoAgregarTaller,
            tooltip: 'Agregar taller',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarTaller,
        child: const Icon(Icons.add),
        tooltip: 'Agregar taller',
      ),
      body: FutureBuilder<List<Taller>>(
        future: _talleresFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.orange));
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      "Error al cargar datos",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _talleresFuture = fetchTalleres();
                        });
                      },
                      child: const Text("Reintentar"),
                    ),
                  ],
                ),
              ),
            );
          }

          final talleres = snapshot.data!;

          if (talleres.isEmpty) {
            return const Center(
              child: Text("No hay talleres disponibles"),
            );
          }

          return ListView.builder(
            itemCount: talleres.length,
            itemBuilder: (context, index) {
              final taller = talleres[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      taller.id.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    taller.nombre,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Especialidad: ${taller.especialidad}"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TallerDetailPage(
                          taller: taller,
                          fetchSucursal: fetchSucursal,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TallerDetailPage extends StatefulWidget {
  final Taller taller;
  final Future<Sucursal?> Function(int) fetchSucursal;

  const TallerDetailPage({
    super.key,
    required this.taller,
    required this.fetchSucursal,
  });

  @override
  State<TallerDetailPage> createState() => _TallerDetailPageState();
}

class _TallerDetailPageState extends State<TallerDetailPage> {
  late Future<List<Reparacion>> _reparacionesFuture;
  late Future<List<Telefono>> _telefonosFuture;
  late Future<List<Cliente>> _clientesFuture;
  final Map<String, TextEditingController> _searchControllers = {};
  final Map<String, String> _searchQueries = {};

  @override
  void initState() {
    super.initState();
    _reparacionesFuture = _fetchReparacionesPorTaller();
    _telefonosFuture = _fetchTelefonos();
    _clientesFuture = _fetchClientes();
  }

  @override
  void dispose() {
    // Limpiar controladores de búsqueda
    for (var controller in _searchControllers.values) {
      controller.dispose();
    }
    _searchControllers.clear();
    super.dispose();
  }

  Future<List<Telefono>> _fetchTelefonos() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/telefonos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Telefono> telefonos = [];
        for (var json in jsonList) {
          try {
            telefonos.add(Telefono.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear teléfono: $e, JSON: $json');
          }
        }
        return telefonos;
      } else {
        throw Exception("Error al cargar teléfonos: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Error al cargar teléfonos: $e');
      return [];
    }
  }

  Future<List<Cliente>> _fetchClientes() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/clientes'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Cliente> clientes = [];
        for (var json in jsonList) {
          try {
            clientes.add(Cliente.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear cliente: $e, JSON: $json');
          }
        }
        return clientes;
      } else {
        throw Exception("Error al cargar clientes: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Error al cargar clientes: $e');
      return [];
    }
  }

  Future<List<Reparacion>> _fetchReparacionesPorTaller() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/reparaciones'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Reparacion> reparaciones = [];
        for (var json in jsonList) {
          try {
            final reparacion = Reparacion.fromJson(json as Map<String, dynamic>);
            // Filtrar solo las reparaciones de este taller
            if (reparacion.tallerId == widget.taller.id) {
              reparaciones.add(reparacion);
            }
          } catch (e) {
            debugPrint('Error al parsear reparación: $e, JSON: $json');
          }
        }
        return reparaciones;
      } else {
        throw Exception("Error al cargar reparaciones: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Error al cargar reparaciones: $e');
      return [];
    }
  }

  List<Reparacion> _filtrarReparacionesPorEstado(List<Reparacion> reparaciones, String estado) {
    return reparaciones.where((r) => r.estado.toLowerCase() == estado.toLowerCase()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taller.nombre),
      ),
      body: FutureBuilder<Sucursal?>(
        future: widget.fetchSucursal(widget.taller.sucursalId),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.hardware, size: 32, color: Colors.orange),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                widget.taller.nombre,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow(Icons.build, "Especialidad", widget.taller.especialidad),
                        const SizedBox(height: 8),
                        _buildInfoRow(Icons.tag, "ID", widget.taller.id.toString()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  elevation: 4,
                  color: Colors.orange.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.store, size: 28, color: Colors.orange),
                            SizedBox(width: 12),
                            Text(
                              "Sucursal",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        if (snapshot.connectionState == ConnectionState.waiting)
                          const Center(child: CircularProgressIndicator(color: Colors.orange))
                        else if (snapshot.hasError || snapshot.data == null)
                          const Text(
                            "No se pudo cargar la información de la sucursal",
                            style: TextStyle(color: Colors.red),
                          )
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoRow(
                                Icons.business,
                                "Nombre",
                                snapshot.data!.nombre,
                              ),
                              const SizedBox(height: 8),
                              _buildInfoRow(
                                Icons.location_on,
                                "Dirección",
                                snapshot.data!.direccion,
                              ),
                              const SizedBox(height: 8),
                              _buildInfoRow(
                                Icons.phone,
                                "Teléfono",
                                snapshot.data!.telefono,
                              ),
                              const SizedBox(height: 8),
                              _buildInfoRow(
                                Icons.tag,
                                "ID Sucursal",
                                snapshot.data!.id.toString(),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Sección de Reparaciones por Estado
                FutureBuilder(
                  future: Future.wait([_reparacionesFuture, _telefonosFuture, _clientesFuture]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator(color: Colors.orange)),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              'Error al cargar datos: ${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      );
                    }

                    final todasReparaciones = snapshot.data![0] as List<Reparacion>;
                    final telefonos = snapshot.data![1] as List<Telefono>;
                    final clientes = snapshot.data![2] as List<Cliente>;
                    
                    // Filtrar reparaciones por estado
                    final completadas = _filtrarReparacionesPorEstado(todasReparaciones, 'completada');
                    final canceladas = _filtrarReparacionesPorEstado(todasReparaciones, 'cancelada');
                    final enProgreso = _filtrarReparacionesPorEstado(todasReparaciones, 'en progreso');
                    final pendientes = _filtrarReparacionesPorEstado(todasReparaciones, 'pendiente');

                    return Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.build, size: 28, color: Colors.orange),
                                SizedBox(width: 12),
                                Text(
                                  "Reparaciones",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Completadas
                            _buildSeccionReparaciones('Completadas', completadas, Colors.green, telefonos, clientes),
                            const SizedBox(height: 16),
                            // Canceladas
                            _buildSeccionReparaciones('Canceladas', canceladas, Colors.red, telefonos, clientes),
                            const SizedBox(height: 16),
                            // En Progreso
                            _buildSeccionReparaciones('En Progreso', enProgreso, Colors.blue, telefonos, clientes),
                            const SizedBox(height: 16),
                            // Pendientes
                            _buildSeccionReparaciones('Pendientes', pendientes, Colors.orange, telefonos, clientes),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSeccionReparaciones(
    String titulo,
    List<Reparacion> reparaciones,
    Color color,
    List<Telefono> telefonos,
    List<Cliente> clientes,
  ) {
    // Usar un Map para almacenar el estado de búsqueda por cada sección
    final searchKey = titulo; // Usar el título como clave única
    if (!_searchControllers.containsKey(searchKey)) {
      _searchControllers[searchKey] = TextEditingController();
      _searchQueries[searchKey] = '';
    }
    
    final searchController = _searchControllers[searchKey]!;
    String searchQuery = _searchQueries[searchKey] ?? '';
    
    // Función para filtrar reparaciones con búsqueda múltiple
    List<Reparacion> reparacionesFiltradas = reparaciones;
    
    if (searchQuery.isNotEmpty) {
      final queryLower = searchQuery.toLowerCase().trim();
      final queryInt = int.tryParse(searchQuery.trim());
      
      // Si la búsqueda es solo numérica, primero intentar buscar solo por ID exacto
      if (queryInt != null && searchQuery.trim() == queryInt.toString()) {
        final resultadosExactos = reparaciones.where((reparacion) {
          return reparacion.id == queryInt;
        }).toList();
        
        // Si encontramos resultados exactos, devolver solo esos
        if (resultadosExactos.isNotEmpty) {
          reparacionesFiltradas = resultadosExactos;
        } else {
          // Si no hay resultados exactos, buscar en todos los campos
          reparacionesFiltradas = reparaciones.where((reparacion) {
            // Buscar por ID de reparación (coincidencia parcial)
            if (reparacion.id.toString().contains(queryLower)) {
              return true;
            }
            
            // Buscar por título de reparación
            if (reparacion.titulo.toLowerCase().contains(queryLower)) {
              return true;
            }
            
            // Buscar por IMEI del teléfono
            final telefono = telefonos.firstWhere(
              (t) => t.id == reparacion.telefonoId,
              orElse: () => Telefono(id: -1, marca: '', modelo: '', clienteId: -1, imei: ''),
            );
            if (telefono.imei.isNotEmpty && telefono.imei.toLowerCase().contains(queryLower)) {
              return true;
            }
            
            // Buscar por nombre y teléfono del cliente
            final cliente = clientes.firstWhere(
              (c) => c.id == telefono.clienteId,
              orElse: () => Cliente(id: -1, nombre: '', telefono: '', direccion: '', email: ''),
            );
            if (cliente.nombre.toLowerCase().contains(queryLower) ||
                cliente.telefono.contains(queryLower)) {
              return true;
            }
            
            // Buscar por fecha de ingreso
            if (reparacion.fechaIngreso.toLowerCase().contains(queryLower)) {
              return true;
            }
            
            return false;
          }).toList();
        }
      } else {
        // Búsqueda múltiple en todos los campos (no numérica o numérica parcial)
        reparacionesFiltradas = reparaciones.where((reparacion) {
          // Buscar por ID de reparación (coincidencia parcial)
          if (reparacion.id.toString().contains(queryLower)) {
            return true;
          }
          
          // Buscar por título de reparación
          if (reparacion.titulo.toLowerCase().contains(queryLower)) {
            return true;
          }
          
          // Buscar por IMEI del teléfono
          final telefono = telefonos.firstWhere(
            (t) => t.id == reparacion.telefonoId,
            orElse: () => Telefono(id: -1, marca: '', modelo: '', clienteId: -1, imei: ''),
          );
          if (telefono.imei.isNotEmpty && telefono.imei.toLowerCase().contains(queryLower)) {
            return true;
          }
          
          // Buscar por nombre y teléfono del cliente
          final cliente = clientes.firstWhere(
            (c) => c.id == telefono.clienteId,
            orElse: () => Cliente(id: -1, nombre: '', telefono: '', direccion: '', email: ''),
          );
          if (cliente.nombre.toLowerCase().contains(queryLower) ||
              cliente.telefono.contains(queryLower)) {
            return true;
          }
          
          // Buscar por fecha de ingreso
          if (reparacion.fechaIngreso.toLowerCase().contains(queryLower)) {
            return true;
          }
          
          return false;
        }).toList();
      }
    }

    return ExpansionTile(
      key: ValueKey('$titulo-${searchQuery.length}'), // Key para forzar reconstrucción
      leading: Icon(Icons.build, color: color),
      title: Text(
        titulo,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      subtitle: Text(
        searchQuery.isNotEmpty
            ? '${reparacionesFiltradas.length} ${reparacionesFiltradas.length == 1 ? 'reparación encontrada' : 'reparaciones encontradas'}'
            : '${reparaciones.length} ${reparaciones.length == 1 ? 'reparación' : 'reparaciones'}',
        style: TextStyle(color: Colors.grey[400]),
      ),
      children: [
        if (reparaciones.isEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                'No hay reparaciones ${titulo.toLowerCase()}',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Barra de búsqueda
                TextField(
                  controller: searchController,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        _searchQueries[searchKey] = value;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Buscar por IMEI, teléfono del cliente, nombre o ID...",
                    prefixIcon: const Icon(Icons.search, color: Colors.orange),
                    suffixIcon: searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              searchController.clear();
                              if (mounted) {
                                setState(() {
                                  _searchQueries[searchKey] = '';
                                });
                              }
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.orange, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.grey[800],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                if (searchQuery.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    '${reparacionesFiltradas.length} ${reparacionesFiltradas.length == 1 ? 'reparación encontrada' : 'reparaciones encontradas'}',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                // Lista de reparaciones filtradas
                if (reparacionesFiltradas.isEmpty && searchQuery.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'No se encontraron reparaciones con ese criterio de búsqueda',
                        style: TextStyle(color: Colors.grey[400]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else
                  ...reparacionesFiltradas.map((reparacion) {
                    final telefono = telefonos.firstWhere(
                      (t) => t.id == reparacion.telefonoId,
                      orElse: () => Telefono(id: -1, marca: '', modelo: '', clienteId: -1, imei: ''),
                    );
                    final cliente = clientes.firstWhere(
                      (c) => c.id == telefono.clienteId,
                      orElse: () => Cliente(id: -1, nombre: '', telefono: '', direccion: '', email: ''),
                    );
                    
                    Color estadoColor = Colors.grey;
                    if (reparacion.estado == 'pendiente') {
                      estadoColor = Colors.orange;
                    } else if (reparacion.estado == 'en progreso') {
                      estadoColor = Colors.blue;
                    } else if (reparacion.estado == 'completada') {
                      estadoColor = Colors.green;
                    } else if (reparacion.estado == 'cancelada') {
                      estadoColor = Colors.red;
                    }
                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                      child: Card(
                        color: Colors.grey[900],
                        child: ExpansionTile(
                          leading: CircleAvatar(
                            backgroundColor: color,
                            child: Text(
                              reparacion.id.toString(),
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          title: Text(
                            reparacion.titulo,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text('Costo: \$${reparacion.coste.toStringAsFixed(2)}'),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: estadoColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: estadoColor),
                                    ),
                                    child: Text(
                                      reparacion.estado.toUpperCase(),
                                      style: TextStyle(
                                        color: estadoColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('ID de Reparación:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.tag, color: Colors.orange),
                                      title: Text('Reparación #${reparacion.id}'),
                                    ),
                                  ),
                                  const Text('Descripción:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(reparacion.descripcion),
                                    ),
                                  ),
                                  const Text('Cliente:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.person, color: Colors.blue),
                                      title: Text(cliente.nombre),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Teléfono: ${cliente.telefono}'),
                                          if (cliente.email.isNotEmpty) Text('Email: ${cliente.email}'),
                                          if (cliente.direccion.isNotEmpty) Text('Dirección: ${cliente.direccion}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Text('Teléfono reparado:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.phone_android, color: Colors.teal),
                                      title: Text('${telefono.marca} ${telefono.modelo}'),
                                      subtitle: Text('IMEI: ${telefono.imei}'),
                                    ),
                                  ),
                                  const Text('Fecha de Ingreso:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.calendar_today, color: Colors.orange),
                                      title: Text(reparacion.fechaIngreso),
                                    ),
                                  ),
                                  if (reparacion.fechaEntrega.isNotEmpty) ...[
                                    const Text('Fecha de Entrega:', style: TextStyle(fontWeight: FontWeight.bold)),
                                    Card(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: ListTile(
                                        leading: const Icon(Icons.event_available, color: Colors.green),
                                        title: Text(reparacion.fechaEntrega),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey[400]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TodasLasEntidadesPage extends StatefulWidget {
  const TodasLasEntidadesPage({super.key});

  @override
  State<TodasLasEntidadesPage> createState() => _TodasLasEntidadesPageState();
}

class _TodasLasEntidadesPageState extends State<TodasLasEntidadesPage> {
  final String baseUrl = 'https://v0-mobile-repair-api.vercel.app';
  
  List<Sucursal>? sucursales;
  List<Taller>? talleres;
  List<Cliente>? clientes;
  List<Tecnico>? tecnicos;
  List<Telefono>? telefonos;
  List<Reparacion>? reparaciones;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  Future<void> _loadAllData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Ejecutar todas las llamadas en paralelo, pero manejar errores individualmente
      final results = await Future.wait([
        _fetchSucursales().catchError((e) {
          debugPrint('Error al cargar sucursales: $e');
          return <Sucursal>[];
        }),
        _fetchTalleres().catchError((e) {
          debugPrint('Error al cargar talleres: $e');
          return <Taller>[];
        }),
        _fetchClientes().catchError((e) {
          debugPrint('Error al cargar clientes: $e');
          return <Cliente>[];
        }),
        _fetchTecnicos().catchError((e) {
          debugPrint('Error al cargar técnicos: $e');
          return <Tecnico>[];
        }),
        _fetchTelefonos().catchError((e) {
          debugPrint('Error al cargar teléfonos: $e');
          return <Telefono>[];
        }),
        _fetchReparaciones().catchError((e) {
          debugPrint('Error al cargar reparaciones: $e');
          return <Reparacion>[];
        }),
      ]);

      final loadedSucursales = results[0] as List<Sucursal>;
      final loadedTalleres = results[1] as List<Taller>;
      final loadedClientes = results[2] as List<Cliente>;
      final loadedTecnicos = results[3] as List<Tecnico>;
      final loadedTelefonos = results[4] as List<Telefono>;
      final loadedReparaciones = results[5] as List<Reparacion>;

      // Verificar si todas las llamadas fallaron
      final allEmpty = loadedSucursales.isEmpty &&
          loadedTalleres.isEmpty &&
          loadedClientes.isEmpty &&
          loadedTecnicos.isEmpty &&
          loadedTelefonos.isEmpty &&
          loadedReparaciones.isEmpty;

      setState(() {
        sucursales = loadedSucursales;
        talleres = loadedTalleres;
        clientes = loadedClientes;
        tecnicos = loadedTecnicos;
        telefonos = loadedTelefonos;
        reparaciones = loadedReparaciones;
        isLoading = false;
        
        if (allEmpty) {
          errorMessage = 'No se pudo cargar ningún dato. Verifica tu conexión a internet y que la API esté disponible. Si estás usando Chrome, ejecuta con: flutter run -d chrome --web-browser-flag="--disable-web-security" --web-browser-flag="--user-data-dir=C:/temp/chrome_dev"';
        }
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error inesperado: ${e.toString()}';
        isLoading = false;
      });
    }
  }

  Future<List<Sucursal>> _fetchSucursales() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/sucursales'),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado al cargar sucursales');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Sucursal> sucursales = [];
        for (var json in jsonList) {
          try {
            sucursales.add(Sucursal.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear sucursal en TodasLasEntidades: $e, JSON: $json');
          }
        }
        return sucursales;
      }
      throw Exception('Error al cargar sucursales: ${response.statusCode}');
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al cargar sucursales');
      }
      rethrow;
    }
  }

  Future<List<Taller>> _fetchTalleres() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/talleres'),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado al cargar talleres');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Taller> talleres = [];
        for (var json in jsonList) {
          try {
            talleres.add(Taller.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear taller en TodasLasEntidades: $e, JSON: $json');
          }
        }
        return talleres;
      }
      throw Exception('Error al cargar talleres: ${response.statusCode}');
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al cargar talleres');
      }
      rethrow;
    }
  }

  Future<List<Cliente>> _fetchClientes() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/clientes'),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado al cargar clientes');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Cliente> clientes = [];
        for (var json in jsonList) {
          try {
            clientes.add(Cliente.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear cliente en TodasLasEntidades: $e, JSON: $json');
          }
        }
        return clientes;
      }
      throw Exception('Error al cargar clientes: ${response.statusCode}');
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al cargar clientes');
      }
      rethrow;
    }
  }

  Future<List<Tecnico>> _fetchTecnicos() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/tecnicos'),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado al cargar técnicos');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Tecnico> tecnicos = [];
        for (var json in jsonList) {
          try {
            tecnicos.add(Tecnico.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear técnico en TodasLasEntidades: $e, JSON: $json');
          }
        }
        return tecnicos;
      }
      throw Exception('Error al cargar técnicos: ${response.statusCode}');
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al cargar técnicos');
      }
      rethrow;
    }
  }

  Future<List<Telefono>> _fetchTelefonos() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/telefonos'),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado al cargar teléfonos');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Telefono> telefonos = [];
        for (var json in jsonList) {
          try {
            telefonos.add(Telefono.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear teléfono en TodasLasEntidades: $e, JSON: $json');
          }
        }
        return telefonos;
      }
      throw Exception('Error al cargar teléfonos: ${response.statusCode}');
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al cargar teléfonos');
      }
      rethrow;
    }
  }

  Future<List<Reparacion>> _fetchReparaciones() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/reparaciones'),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado al cargar reparaciones');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Reparacion> reparaciones = [];
        for (var json in jsonList) {
          try {
            reparaciones.add(Reparacion.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear reparación en TodasLasEntidades: $e, JSON: $json');
          }
        }
        return reparaciones;
      }
      throw Exception('Error al cargar reparaciones: ${response.statusCode}');
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al cargar reparaciones');
      }
      rethrow;
    }
  }

  Sucursal? _getSucursal(int id) {
    return sucursales?.firstWhere((s) => s.id == id, orElse: () => Sucursal(id: -1, nombre: 'No encontrada', direccion: '', telefono: ''));
  }

  Taller? _getTaller(int id) {
    return talleres?.firstWhere((t) => t.id == id, orElse: () => Taller(id: -1, nombre: 'No encontrado', especialidad: '', sucursalId: -1));
  }

  Cliente? _getCliente(int id) {
    return clientes?.firstWhere((c) => c.id == id, orElse: () => Cliente(id: -1, nombre: 'No encontrado', telefono: '', direccion: '', email: ''));
  }

  Tecnico? _getTecnico(int id) {
    return tecnicos?.firstWhere((t) => t.id == id, orElse: () => Tecnico(id: -1, nombre: 'No encontrado', especialidad: '', telefono: '', tallerId: -1));
  }

  Telefono? _getTelefono(int id) {
    return telefonos?.firstWhere((t) => t.id == id, orElse: () => Telefono(id: -1, marca: '', modelo: '', clienteId: -1, imei: ''));
  }

  List<Taller> _getTalleresPorSucursal(int sucursalId) {
    return talleres?.where((t) => t.sucursalId == sucursalId).toList() ?? [];
  }

  List<Telefono> _getTelefonosPorCliente(int clienteId) {
    return telefonos?.where((t) => t.clienteId == clienteId).toList() ?? [];
  }

  List<Telefono> _getTelefonosPorTecnico(int tecnicoId) {
    // Los teléfonos ya no tienen técnico asignado, retornar lista vacía
    return [];
  }

  List<Reparacion> _getReparacionesPorTaller(int tallerId) {
    return reparaciones?.where((r) => r.tallerId == tallerId).toList() ?? [];
  }

  List<Reparacion> _getReparacionesPorTelefono(int telefonoId) {
    return reparaciones?.where((r) => r.telefonoId == telefonoId).toList() ?? [];
  }

  List<Reparacion> _getReparacionesPorTecnico(int tecnicoId) {
    return reparaciones?.where((r) => r.tecnicoId == tecnicoId).toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Todas las Entidades')),
        body: const Center(child: CircularProgressIndicator(color: Colors.orange)),
      );
    }

    if (errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Todas las Entidades')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error al cargar datos',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  errorMessage!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (errorMessage!.contains('CORS'))
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        const Text(
                          'Solución: Ejecuta la app con Chrome sin seguridad:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'flutter run -d chrome --web-browser-flag="--disable-web-security" --web-browser-flag="--user-data-dir=C:/temp/chrome_dev"',
                          style: TextStyle(fontSize: 12, fontFamily: 'monospace'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadAllData,
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todas las Entidades'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadAllData,
            tooltip: 'Actualizar',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Sucursales',
              Icons.store,
              Colors.orange,
              sucursales?.map((s) => _buildSucursalCard(s)).toList() ?? [],
            ),
            _buildSection(
              'Talleres',
              Icons.hardware,
              Colors.orange,
              talleres?.map((t) => _buildTallerCard(t)).toList() ?? [],
            ),
            _buildSection(
              'Clientes',
              Icons.person,
              Colors.orange,
              clientes?.map((c) => _buildClienteCard(c)).toList() ?? [],
            ),
            _buildSection(
              'Técnicos',
              Icons.engineering,
              Colors.orange,
              tecnicos?.map((t) => _buildTecnicoCard(t)).toList() ?? [],
            ),
            _buildSection(
              'Teléfonos',
              Icons.phone_android,
              Colors.orange,
              telefonos?.map((t) => _buildTelefonoCard(t)).toList() ?? [],
            ),
            _buildSection(
              'Reparaciones',
              Icons.build,
              Colors.red,
              reparaciones?.map((r) => _buildReparacionCard(r)).toList() ?? [],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, Color color, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: color.withOpacity(0.1),
          child: Row(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const Spacer(),
              Text(
                '${children.length}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
        ...children,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSucursalCard(Sucursal sucursal) {
    final talleresSucursal = _getTalleresPorSucursal(sucursal.id);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: CircleAvatar(backgroundColor: Colors.orange, child: Text(sucursal.id.toString(), style: const TextStyle(color: Colors.white))),
        title: Text(sucursal.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dirección: ${sucursal.direccion}'),
            Text('Teléfono: ${sucursal.telefono}'),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Talleres asociados:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (talleresSucursal.isEmpty)
                  const Text('No hay talleres asociados', style: TextStyle(color: Colors.grey))
                else
                  ...talleresSucursal.map((t) => Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4),
                    child: Text('• ${t.nombre} - Especialidad: ${t.especialidad}'),
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTallerCard(Taller taller) {
    final sucursal = _getSucursal(taller.sucursalId);
    final reparacionesTaller = _getReparacionesPorTaller(taller.id);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: CircleAvatar(backgroundColor: Colors.orange, child: Text(taller.id.toString(), style: const TextStyle(color: Colors.white))),
        title: Text(taller.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Especialidad: ${taller.especialidad}'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sucursal:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text('${sucursal?.nombre ?? "No encontrada"} - ${sucursal?.direccion ?? ""}'),
                ),
                const Text('Reparaciones:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (reparacionesTaller.isEmpty)
                  const Text('No hay reparaciones', style: TextStyle(color: Colors.grey))
                else
                  ...reparacionesTaller.map((r) => Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4),
                    child: Text('• ${r.titulo} - \$${r.coste.toStringAsFixed(2)}'),
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClienteCard(Cliente cliente) {
    final telefonosCliente = _getTelefonosPorCliente(cliente.id);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: CircleAvatar(backgroundColor: Colors.orange, child: Text(cliente.id.toString(), style: const TextStyle(color: Colors.white))),
        title: Text(cliente.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Teléfono: ${cliente.telefono}'),
            Text('Email: ${cliente.email}'),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Información del Cliente:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Dirección: ${cliente.direccion}'),
                const SizedBox(height: 4),
                Text('Email: ${cliente.email}'),
                const SizedBox(height: 16),
                const Text('Teléfonos asociados:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (telefonosCliente.isEmpty)
                  const Text('No hay teléfonos asociados', style: TextStyle(color: Colors.grey))
                else
                  ...telefonosCliente.map((t) => Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4),
                    child: Text('• ${t.marca} ${t.modelo}'),
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTecnicoCard(Tecnico tecnico) {
    final telefonosTecnico = _getTelefonosPorTecnico(tecnico.id);
    final reparacionesTecnico = _getReparacionesPorTecnico(tecnico.id);
    final taller = _getTaller(tecnico.tallerId);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: CircleAvatar(backgroundColor: Colors.orange, child: Text(tecnico.id.toString(), style: const TextStyle(color: Colors.white))),
        title: Text(tecnico.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Especialidad: ${tecnico.especialidad}'),
            Text('Teléfono: ${tecnico.telefono}'),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Taller asignado:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text('${taller?.nombre ?? "No encontrado"} - ${taller?.especialidad ?? ""}'),
                ),
                const Text('Reparaciones asignadas:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (reparacionesTecnico.isEmpty)
                  const Text('No hay reparaciones asignadas', style: TextStyle(color: Colors.grey))
                else
                  ...reparacionesTecnico.map((r) => Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4),
                    child: Text('• ${r.titulo} - \$${r.coste.toStringAsFixed(2)} - ${r.estado}'),
                  )),
                const SizedBox(height: 16),
                const Text('Teléfonos asignados:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (telefonosTecnico.isEmpty)
                  const Text('No hay teléfonos asignados', style: TextStyle(color: Colors.grey))
                else
                  ...telefonosTecnico.map((t) => Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4),
                    child: Text('• ${t.marca} ${t.modelo}'),
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTelefonoCard(Telefono telefono) {
    final cliente = _getCliente(telefono.clienteId);
    final reparacionesTelefono = _getReparacionesPorTelefono(telefono.id);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: CircleAvatar(backgroundColor: Colors.orange, child: Text(telefono.id.toString(), style: const TextStyle(color: Colors.white))),
        title: Text('${telefono.marca} ${telefono.modelo}', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Cliente: ${cliente?.nombre ?? "No encontrado"}'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Cliente:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text('${cliente?.nombre ?? "No encontrado"} - ${cliente?.telefono ?? ""}'),
                ),
                const Text('IMEI:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text(telefono.imei),
                ),
                const Text('Reparaciones:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (reparacionesTelefono.isEmpty)
                  const Text('No hay reparaciones', style: TextStyle(color: Colors.grey))
                else
                  ...reparacionesTelefono.map((r) => Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4),
                    child: Text('• ${r.titulo} - \$${r.coste.toStringAsFixed(2)}'),
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int _calcularDuracionEnHoras(Reparacion reparacion) {
    try {
      if (reparacion.fechaIngreso.isEmpty) {
        return 0;
      }
      
      final fechaIngreso = DateTime.parse(reparacion.fechaIngreso);
      DateTime fechaEntrega;
      
      if (reparacion.fechaEntrega.isNotEmpty) {
        fechaEntrega = DateTime.parse(reparacion.fechaEntrega);
      } else {
        fechaEntrega = DateTime.now();
      }
      
      final diferencia = fechaEntrega.difference(fechaIngreso);
      final horas = diferencia.inHours;
      return horas < 0 ? 0 : horas;
    } catch (e) {
      debugPrint('Error al calcular duración: $e');
      return 0;
    }
  }

  Widget _buildReparacionCard(Reparacion reparacion) {
    final taller = _getTaller(reparacion.tallerId);
    final telefono = _getTelefono(reparacion.telefonoId);
    final tecnico = _getTecnico(reparacion.tecnicoId);
    final sucursal = taller != null ? _getSucursal(taller.sucursalId) : null;
    final duracionHoras = _calcularDuracionEnHoras(reparacion);
    
    Color estadoColor = Colors.grey;
    if (reparacion.estado == 'pendiente') {
      estadoColor = Colors.orange;
    } else if (reparacion.estado == 'a retirar') {
      estadoColor = Colors.blue;
    } else if (reparacion.estado == 'entregado') {
      estadoColor = Colors.green;
    }
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: CircleAvatar(backgroundColor: Colors.red, child: Text(reparacion.id.toString(), style: const TextStyle(color: Colors.white))),
        title: Text(reparacion.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Costo: \$${reparacion.coste.toStringAsFixed(2)} | Duración: $duracionHoras ${duracionHoras == 1 ? 'hora' : 'horas'}'),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: estadoColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: estadoColor),
                  ),
                  child: Text(
                    reparacion.estado.toUpperCase(),
                    style: TextStyle(
                      color: estadoColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Descripción:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text(reparacion.descripcion),
                ),
                const Text('Técnico asignado:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text('${tecnico?.nombre ?? "No encontrado"} - ${tecnico?.especialidad ?? ""}'),
                ),
                const Text('Taller:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text('${taller?.nombre ?? "No encontrado"} - Especialidad: ${taller?.especialidad ?? ""}'),
                ),
                const Text('Sucursal del taller:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text('${sucursal?.nombre ?? "No encontrada"} - ${sucursal?.direccion ?? ""}'),
                ),
                const Text('Teléfono:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text('${telefono?.marca ?? ""} ${telefono?.modelo ?? ""} - IMEI: ${telefono?.imei ?? ""}'),
                ),
                const Text('Fecha de Ingreso:', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                  child: Text(reparacion.fechaIngreso),
                ),
                if (reparacion.fechaEntrega.isNotEmpty) ...[
                  const Text('Fecha de Entrega:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
                    child: Text(reparacion.fechaEntrega),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== PANTALLA DE CLIENTES ====================
class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  late Future<List<Cliente>> _clientesFuture;

  @override
  void initState() {
    super.initState();
    _clientesFuture = fetchClientes();
  }

  Future<List<Cliente>> fetchClientes() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/clientes'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado. Verifica la conexión a internet y que la API esté disponible en $baseUrl');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Cliente> clientes = [];
        for (var json in jsonList) {
          try {
            clientes.add(Cliente.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear cliente: $e, JSON: $json');
          }
        }
        return clientes;
      } else {
        throw Exception("Error al cargar clientes: ${response.statusCode}");
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception(
          'Error de CORS: La API no permite solicitudes desde el navegador.\n\n'
          'Solución: Ejecuta la app en modo móvil o desktop:\n'
          '• flutter run -d windows (Windows)\n'
          '• flutter run -d macos (macOS)\n'
          '• flutter run -d linux (Linux)'
        );
      }
      
      if (errorString.contains('Connection refused') || 
          errorString.contains('ERR_CONNECTION_RESET') ||
          errorString.contains('Failed host lookup') ||
          errorString.contains('ERR_FAILED')) {
        throw Exception('No se puede conectar al servidor. Verifica tu conexión a internet y que la API esté disponible en $baseUrl');
      }
      rethrow;
    }
  }

  Future<List<Telefono>> fetchTelefonos() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    final response = await http.get(
      Uri.parse('$baseUrl/api/telefonos'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<Telefono> telefonos = [];
      for (var json in jsonList) {
        try {
          telefonos.add(Telefono.fromJson(json as Map<String, dynamic>));
        } catch (e) {
          debugPrint('Error al parsear teléfono en ClientesPage: $e, JSON: $json');
        }
      }
      return telefonos;
    }
    return [];
  }

  Future<bool> crearCliente(String nombre, String telefono, String direccion, String email) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/clientes'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'nombre': nombre,
          'telefono': telefono,
          'direccion': direccion,
          'email': email,
        }),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        String errorMessage = 'Error al crear cliente: ${response.statusCode}';
        try {
          final errorBody = jsonDecode(response.body);
          if (errorBody is Map && errorBody.containsKey('message')) {
            errorMessage = 'Error: ${errorBody['message']}';
          } else if (errorBody is Map && errorBody.containsKey('error')) {
            errorMessage = 'Error: ${errorBody['error']}';
          } else {
            errorMessage = 'Error ${response.statusCode}: ${response.body}';
          }
        } catch (_) {
          errorMessage = 'Error ${response.statusCode}: ${response.body}';
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al crear cliente');
      }
      rethrow;
    }
  }

  void _mostrarDialogoAgregarCliente() {
    final nombreController = TextEditingController();
    final telefonoController = TextEditingController();
    final direccionController = TextEditingController();
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final scaffoldContext = context;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Agregar Nuevo Cliente'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nombreController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: telefonoController,
                    decoration: const InputDecoration(
                      labelText: 'Teléfono',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el teléfono';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: direccionController,
                    decoration: const InputDecoration(
                      labelText: 'Dirección',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la dirección';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el email';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Por favor ingrese un email válido';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  Navigator.of(dialogContext).pop();
                  
                  if (!mounted) return;
                  
                  showDialog(
                    context: scaffoldContext,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    ),
                  );

                  try {
                    final exito = await crearCliente(
                      nombreController.text.trim(),
                      telefonoController.text.trim(),
                      direccionController.text.trim(),
                      emailController.text.trim(),
                    );

                    if (!mounted) return;
                    
                    Navigator.of(scaffoldContext).pop();

                    if (exito) {
                      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                        const SnackBar(
                          content: Text('Cliente creado exitosamente'),
                          backgroundColor: Colors.orange,
                        ),
                      );
                      setState(() {
                        _clientesFuture = fetchClientes();
                      });
                    }
                  } catch (e) {
                    if (!mounted) return;
                    
                    Navigator.of(scaffoldContext).pop();
                    ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                      SnackBar(
                        content: Text('Error al crear cliente: ${e.toString()}'),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 4),
                      ),
                    );
                  }
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clientes"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarDialogoAgregarCliente,
            tooltip: 'Agregar cliente',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarCliente,
        child: const Icon(Icons.add),
        tooltip: 'Agregar cliente',
      ),
      body: FutureBuilder<List<Cliente>>(
        future: _clientesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.orange));
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      "Error al cargar datos",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clientesFuture = fetchClientes();
                        });
                      },
                      child: const Text("Reintentar"),
                    ),
                  ],
                ),
              ),
            );
          }

          final clientes = snapshot.data!;

          if (clientes.isEmpty) {
            return const Center(
              child: Text("No hay clientes disponibles"),
            );
          }

          return FutureBuilder<List<Telefono>>(
            future: fetchTelefonos(),
            builder: (context, telefonosSnapshot) {
              final telefonos = telefonosSnapshot.data ?? [];
              
              return ListView.builder(
                itemCount: clientes.length,
                itemBuilder: (context, index) {
                  final cliente = clientes[index];
                  final telefonosCliente = telefonos.where((t) => t.clienteId == cliente.id).toList();
                  
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(
                          cliente.id.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        cliente.nombre,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Teléfono: ${cliente.telefono}"),
                          Text("Email: ${cliente.email}"),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Teléfonos asociados:', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              if (telefonosCliente.isEmpty)
                                const Text('No hay teléfonos asociados', style: TextStyle(color: Colors.grey))
                              else
                                ...telefonosCliente.map((t) => Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    leading: const Icon(Icons.phone_android, color: Colors.teal),
                                    title: Text('${t.marca} ${t.modelo}'),
                                    subtitle: Text('ID: ${t.id}'),
                                  ),
                                )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// ==================== PANTALLA DE TÉCNICOS ====================
class TecnicosPage extends StatefulWidget {
  const TecnicosPage({super.key});

  @override
  State<TecnicosPage> createState() => _TecnicosPageState();
}

class _TecnicosPageState extends State<TecnicosPage> {
  late Future<List<Tecnico>> _tecnicosFuture;

  @override
  void initState() {
    super.initState();
    _tecnicosFuture = fetchTecnicos();
  }

  Future<List<Tecnico>> fetchTecnicos() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/tecnicos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado. Verifica la conexión a internet y que la API esté disponible en $baseUrl');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Tecnico> tecnicos = [];
        for (var json in jsonList) {
          try {
            tecnicos.add(Tecnico.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear técnico: $e, JSON: $json');
          }
        }
        return tecnicos;
      } else {
        throw Exception("Error al cargar técnicos: ${response.statusCode}");
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception(
          'Error de CORS: La API no permite solicitudes desde el navegador.\n\n'
          'Solución: Ejecuta la app en modo móvil o desktop:\n'
          '• flutter run -d windows (Windows)\n'
          '• flutter run -d macos (macOS)\n'
          '• flutter run -d linux (Linux)'
        );
      }
      
      if (errorString.contains('Connection refused') || 
          errorString.contains('ERR_CONNECTION_RESET') ||
          errorString.contains('Failed host lookup') ||
          errorString.contains('ERR_FAILED')) {
        throw Exception('No se puede conectar al servidor. Verifica tu conexión a internet y que la API esté disponible en $baseUrl');
      }
      rethrow;
    }
  }

  Future<List<Telefono>> fetchTelefonos() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    final response = await http.get(
      Uri.parse('$baseUrl/api/telefonos'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Telefono.fromJson(json as Map<String, dynamic>)).toList();
    }
    return [];
  }

  Future<List<Taller>> fetchTalleres() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/talleres'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Taller> talleres = [];
        for (var json in jsonList) {
          try {
            talleres.add(Taller.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear taller: $e, JSON: $json');
          }
        }
        return talleres;
      } else {
        throw Exception("Error al cargar talleres: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error al cargar talleres: ${e.toString()}');
    }
  }

  Future<Taller?> fetchTaller(int tallerId) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/talleres/$tallerId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Taller.fromJson(json as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> crearTecnico(String nombre, String especialidad, String telefono, int tallerId) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/tecnicos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'nombre': nombre,
          'especialidad': especialidad,
          'telefono': telefono,
          'taller_id': tallerId,
        }),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        String errorMessage = 'Error al crear técnico: ${response.statusCode}';
        try {
          final errorBody = jsonDecode(response.body);
          if (errorBody is Map && errorBody.containsKey('message')) {
            errorMessage = 'Error: ${errorBody['message']}';
          } else if (errorBody is Map && errorBody.containsKey('error')) {
            errorMessage = 'Error: ${errorBody['error']}';
          } else {
            errorMessage = 'Error ${response.statusCode}: ${response.body}';
          }
        } catch (_) {
          errorMessage = 'Error ${response.statusCode}: ${response.body}';
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al crear técnico');
      }
      rethrow;
    }
  }

  Future<int?> _mostrarDialogoSeleccionarTaller() async {
    final TextEditingController searchController = TextEditingController();
    String searchQuery = '';
    Timer? debounceTimer;
    String? selectedLetter;
    final ScrollController scrollController = ScrollController();
    final Map<String, GlobalKey> sectionKeys = {};
    int? tallerSeleccionado;

    return showDialog<int>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            void onSearchChanged(String value) {
              debounceTimer?.cancel();
              debounceTimer = Timer(const Duration(milliseconds: 300), () {
                setDialogState(() {
                  searchQuery = value.toLowerCase();
                });
              });
            }

            void scrollToSection(String letter) {
              if (sectionKeys.containsKey(letter)) {
                final key = sectionKeys[letter]!;
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setDialogState(() {
                  selectedLetter = letter;
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  setDialogState(() {
                    selectedLetter = null;
                  });
                });
              }
            }

            return Dialog(
              backgroundColor: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.black,
                child: Column(
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.hardware, color: Colors.orange),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Seleccionar Taller',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(dialogContext).pop(),
                          ),
                        ],
                      ),
                    ),
                    // Barra de búsqueda
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: searchController,
                        onChanged: onSearchChanged,
                        decoration: InputDecoration(
                          hintText: "Buscar talleres...",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    searchController.clear();
                                    setDialogState(() {
                                      searchQuery = '';
                                    });
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.orange, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.grey[900],
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          labelStyle: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    // Lista de talleres
                    Expanded(
                      child: FutureBuilder<List<Taller>>(
                        future: fetchTalleres(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator(color: Colors.orange));
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error al cargar talleres: ${snapshot.error}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }

                          final talleres = snapshot.data ?? [];

                          if (talleres.isEmpty) {
                            return const Center(
                              child: Text(
                                'No hay talleres disponibles',
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }

                          // Filtrar talleres según la búsqueda
                          final talleresFiltrados = searchQuery.isEmpty
                              ? talleres
                              : talleres.where((t) {
                                  return t.nombre.toLowerCase().contains(searchQuery) ||
                                      t.especialidad.toLowerCase().contains(searchQuery);
                                }).toList();

                          // Agrupar por letra inicial
                          final Map<String, List<Taller>> talleresAgrupados = {};
                          for (var taller in talleresFiltrados) {
                            final inicial = taller.nombre.isNotEmpty
                                ? taller.nombre[0].toUpperCase()
                                : '#';
                            if (!talleresAgrupados.containsKey(inicial)) {
                              talleresAgrupados[inicial] = [];
                            }
                            talleresAgrupados[inicial]!.add(taller);
                          }

                          // Ordenar las letras
                          final letrasOrdenadas = talleresAgrupados.keys.toList()..sort();

                          // Ordenar cada grupo alfabéticamente
                          for (var letra in letrasOrdenadas) {
                            talleresAgrupados[letra]!.sort((a, b) =>
                                a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase()));
                          }

                          if (talleresFiltrados.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                                  const SizedBox(height: 16),
                                  Text(
                                    "No se encontraron talleres",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Stack(
                            children: [
                              ListView.builder(
                                controller: scrollController,
                                itemCount: letrasOrdenadas.length,
                                itemBuilder: (context, index) {
                                  final letra = letrasOrdenadas[index];
                                  final talleresLetra = talleresAgrupados[letra]!;

                                  if (!sectionKeys.containsKey(letra)) {
                                    sectionKeys[letra] = GlobalKey();
                                  }

                                  return Column(
                                    key: sectionKeys[letra],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Lista de talleres de esta letra
                                      ...talleresLetra.map((taller) {
                                        final isSelected = tallerSeleccionado == taller.id;
                                        return ListTile(
                                          leading: Icon(
                                            Icons.hardware,
                                            color: isSelected ? Colors.orange : Colors.grey[400],
                                          ),
                                          title: Text(
                                            taller.nombre,
                                            style: TextStyle(
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: isSelected ? Colors.orange : Colors.white,
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(Icons.build,
                                                      size: 14, color: Colors.grey[400]),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    taller.especialidad,
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          trailing: isSelected
                                              ? const Icon(Icons.check_circle, color: Colors.orange)
                                              : null,
                                          onTap: () {
                                            setDialogState(() {
                                              tallerSeleccionado = taller.id;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ],
                                  );
                                },
                              ),
                              // Scroll rápido lateral
                              if (searchQuery.isEmpty && letrasOrdenadas.length > 3)
                                Positioned(
                                  right: 4,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: letrasOrdenadas.map((letra) {
                                          final isSelected = selectedLetter == letra;
                                          return GestureDetector(
                                            onTap: () => scrollToSection(letra),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? Colors.orange
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                letra,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: isSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.orange,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    // Nota discreta y botones
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          if (searchQuery.isEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 14,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Ordenados alfabéticamente',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.of(dialogContext).pop(),
                                child: const Text('Cancelar'),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: tallerSeleccionado != null
                                    ? () {
                                        Navigator.of(dialogContext).pop(tallerSeleccionado);
                                      }
                                    : null,
                                child: const Text('Seleccionar'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _mostrarDialogoAgregarTecnico() {
    final nombreController = TextEditingController();
    final especialidadController = TextEditingController();
    final telefonoController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final scaffoldContext = context;
    int? tallerIdSeleccionado;
    String? nombreTallerSeleccionado;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Agregar Nuevo Técnico'),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: nombreController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.engineering),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el nombre';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: especialidadController,
                        decoration: const InputDecoration(
                          labelText: 'Especialidad',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.build),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la especialidad';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: telefonoController,
                        decoration: const InputDecoration(
                          labelText: 'Teléfono',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el teléfono';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Selector de taller con búsqueda
                      InkWell(
                        onTap: () async {
                          final idSeleccionado = await _mostrarDialogoSeleccionarTaller();
                          if (idSeleccionado != null) {
                            // Obtener el nombre del taller seleccionado
                            final taller = await fetchTaller(idSeleccionado);
                            setDialogState(() {
                              tallerIdSeleccionado = idSeleccionado;
                              nombreTallerSeleccionado = taller?.nombre ?? 'Taller seleccionado';
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.hardware, color: Colors.orange),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Taller',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      nombreTallerSeleccionado ?? 'Seleccionar taller',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: nombreTallerSeleccionado != null
                                            ? Colors.black87
                                            : Colors.grey,
                                        fontWeight: nombreTallerSeleccionado != null
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (tallerIdSeleccionado == null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Por favor seleccione un taller',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate() && tallerIdSeleccionado != null) {
                      Navigator.of(dialogContext).pop();
                      
                      if (!mounted) return;
                      
                      showDialog(
                        context: scaffoldContext,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(color: Colors.orange),
                        ),
                      );

                      try {
                        final exito = await crearTecnico(
                          nombreController.text.trim(),
                          especialidadController.text.trim(),
                          telefonoController.text.trim(),
                          tallerIdSeleccionado!,
                        );

                        if (!mounted) return;
                        
                        Navigator.of(scaffoldContext).pop();

                        if (exito) {
                          ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                            const SnackBar(
                              content: Text('Técnico creado exitosamente'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                          setState(() {
                            _tecnicosFuture = fetchTecnicos();
                          });
                        }
                      } catch (e) {
                        if (!mounted) return;
                        
                        Navigator.of(scaffoldContext).pop();
                        ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                          SnackBar(
                            content: Text('Error al crear técnico: ${e.toString()}'),
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 4),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Técnicos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarDialogoAgregarTecnico,
            tooltip: 'Agregar técnico',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarTecnico,
        child: const Icon(Icons.add),
        tooltip: 'Agregar técnico',
      ),
      body: FutureBuilder<List<Tecnico>>(
        future: _tecnicosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.orange));
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      "Error al cargar datos",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tecnicosFuture = fetchTecnicos();
                        });
                      },
                      child: const Text("Reintentar"),
                    ),
                  ],
                ),
              ),
            );
          }

          final tecnicos = snapshot.data!;

          if (tecnicos.isEmpty) {
            return const Center(
              child: Text("No hay técnicos disponibles"),
            );
          }

          return FutureBuilder<List<dynamic>>(
            future: Future.wait([
              fetchTelefonos(),
              fetchTalleres(),
            ]),
            builder: (context, relacionesSnapshot) {
              if (relacionesSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.orange));
              }

              final telefonos = relacionesSnapshot.data?[0] as List<Telefono>? ?? [];
              final talleres = relacionesSnapshot.data?[1] as List<Taller>? ?? [];
              
              return ListView.builder(
                itemCount: tecnicos.length,
                itemBuilder: (context, index) {
                  final tecnico = tecnicos[index];
                  // Los teléfonos ya no tienen técnico asignado
                  final telefonosTecnico = <Telefono>[];
                  final taller = talleres.firstWhere(
                    (t) => t.id == tecnico.tallerId,
                    orElse: () => Taller(id: -1, nombre: 'No encontrado', especialidad: '', sucursalId: -1),
                  );
                  
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: Text(
                          tecnico.id.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        tecnico.nombre,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Especialidad: ${tecnico.especialidad}"),
                          Text("Teléfono: ${tecnico.telefono}"),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Taller asignado:', style: TextStyle(fontWeight: FontWeight.bold)),
                              Card(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: ListTile(
                                  leading: const Icon(Icons.hardware, color: Colors.orange),
                                  title: Text(taller.nombre),
                                  subtitle: Text('Especialidad: ${taller.especialidad}'),
                                ),
                              ),
                              const Text('Teléfonos asignados:', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              if (telefonosTecnico.isEmpty)
                                const Text('No hay teléfonos asignados', style: TextStyle(color: Colors.grey))
                              else
                                ...telefonosTecnico.map((t) => Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    leading: const Icon(Icons.phone_android, color: Colors.teal),
                                    title: Text('${t.marca} ${t.modelo}'),
                                    subtitle: Text('ID: ${t.id}'),
                                  ),
                                )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// ==================== PANTALLA DE TELÉFONOS ====================
class TelefonosPage extends StatefulWidget {
  const TelefonosPage({super.key});

  @override
  State<TelefonosPage> createState() => _TelefonosPageState();
}

class _TelefonosPageState extends State<TelefonosPage> {
  late Future<List<Telefono>> _telefonosFuture;

  @override
  void initState() {
    super.initState();
    _telefonosFuture = fetchTelefonos();
  }

  int _calcularDuracionEnHoras(Reparacion reparacion) {
    try {
      if (reparacion.fechaIngreso.isEmpty) {
        return 0;
      }
      
      final fechaIngreso = DateTime.parse(reparacion.fechaIngreso);
      DateTime fechaEntrega;
      
      if (reparacion.fechaEntrega.isNotEmpty) {
        fechaEntrega = DateTime.parse(reparacion.fechaEntrega);
      } else {
        fechaEntrega = DateTime.now();
      }
      
      final diferencia = fechaEntrega.difference(fechaIngreso);
      final horas = diferencia.inHours;
      return horas < 0 ? 0 : horas;
    } catch (e) {
      debugPrint('Error al calcular duración: $e');
      return 0;
    }
  }

  Future<List<Telefono>> fetchTelefonos() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/telefonos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado. Verifica la conexión a internet y que la API esté disponible en $baseUrl');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Telefono> telefonos = [];
        for (var json in jsonList) {
          try {
            telefonos.add(Telefono.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear teléfono: $e, JSON: $json');
          }
        }
        return telefonos;
      } else {
        throw Exception("Error al cargar teléfonos: ${response.statusCode}");
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception(
          'Error de CORS: La API no permite solicitudes desde el navegador.\n\n'
          'Solución: Ejecuta la app en modo móvil o desktop:\n'
          '• flutter run -d windows (Windows)\n'
          '• flutter run -d macos (macOS)\n'
          '• flutter run -d linux (Linux)'
        );
      }
      
      if (errorString.contains('Connection refused') || 
          errorString.contains('ERR_CONNECTION_RESET') ||
          errorString.contains('Failed host lookup') ||
          errorString.contains('ERR_FAILED')) {
        throw Exception('No se puede conectar al servidor. Verifica tu conexión a internet y que la API esté disponible en $baseUrl');
      }
      rethrow;
    }
  }

  Future<List<Reparacion>> fetchReparaciones() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    final response = await http.get(
      Uri.parse('$baseUrl/api/reparaciones'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<Reparacion> reparaciones = [];
      for (var json in jsonList) {
        try {
          reparaciones.add(Reparacion.fromJson(json as Map<String, dynamic>));
        } catch (e) {
          debugPrint('Error al parsear reparación en TelefonosPage: $e, JSON: $json');
        }
      }
      return reparaciones;
    }
    return [];
  }

  Future<List<Cliente>> fetchClientes() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    final response = await http.get(
      Uri.parse('$baseUrl/api/clientes'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<Cliente> clientes = [];
      for (var json in jsonList) {
        try {
          clientes.add(Cliente.fromJson(json as Map<String, dynamic>));
        } catch (e) {
          debugPrint('Error al parsear cliente en TelefonosPage: $e, JSON: $json');
        }
      }
      return clientes;
    }
    return [];
  }

  Future<Cliente?> fetchCliente(int clienteId) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/clientes/$clienteId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Cliente.fromJson(json as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<Tecnico>> fetchTecnicos() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    final response = await http.get(
      Uri.parse('$baseUrl/api/tecnicos'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<Tecnico> tecnicos = [];
      for (var json in jsonList) {
        try {
          tecnicos.add(Tecnico.fromJson(json as Map<String, dynamic>));
        } catch (e) {
          debugPrint('Error al parsear técnico en TelefonosPage: $e, JSON: $json');
        }
      }
      return tecnicos;
    }
    return [];
  }

  Future<bool> crearTelefono(String marca, String modelo, String imei, int clienteId) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/telefonos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'marca': marca,
          'modelo': modelo,
          'imei': imei,
          'cliente_id': clienteId,
        }),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        String errorMessage = 'Error al crear teléfono: ${response.statusCode}';
        try {
          final errorBody = jsonDecode(response.body);
          if (errorBody is Map && errorBody.containsKey('message')) {
            errorMessage = 'Error: ${errorBody['message']}';
          } else if (errorBody is Map && errorBody.containsKey('error')) {
            errorMessage = 'Error: ${errorBody['error']}';
          } else {
            errorMessage = 'Error ${response.statusCode}: ${response.body}';
          }
        } catch (_) {
          errorMessage = 'Error ${response.statusCode}: ${response.body}';
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al crear teléfono');
      }
      rethrow;
    }
  }

  Future<int?> _mostrarDialogoSeleccionarCliente() async {
    final TextEditingController searchController = TextEditingController();
    String searchQuery = '';
    Timer? debounceTimer;
    String? selectedLetter;
    final ScrollController scrollController = ScrollController();
    final Map<String, GlobalKey> sectionKeys = {};
    int? clienteSeleccionado;

    return showDialog<int>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            void onSearchChanged(String value) {
              debounceTimer?.cancel();
              debounceTimer = Timer(const Duration(milliseconds: 300), () {
                setDialogState(() {
                  searchQuery = value.toLowerCase();
                });
              });
            }

            void scrollToSection(String letter) {
              if (sectionKeys.containsKey(letter)) {
                final key = sectionKeys[letter]!;
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setDialogState(() {
                  selectedLetter = letter;
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  setDialogState(() {
                    selectedLetter = null;
                  });
                });
              }
            }

            return Dialog(
              backgroundColor: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.black,
                child: Column(
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.person, color: Colors.orange),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Seleccionar Cliente',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(dialogContext).pop(),
                          ),
                        ],
                      ),
                    ),
                    // Barra de búsqueda
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: searchController,
                        onChanged: onSearchChanged,
                        decoration: InputDecoration(
                          hintText: "Buscar clientes...",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    searchController.clear();
                                    setDialogState(() {
                                      searchQuery = '';
                                    });
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.orange, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.grey[900],
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          labelStyle: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    // Lista de clientes
                    Expanded(
                      child: FutureBuilder<List<Cliente>>(
                        future: fetchClientes(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator(color: Colors.orange));
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error al cargar clientes: ${snapshot.error}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }

                          final clientes = snapshot.data ?? [];

                          if (clientes.isEmpty) {
                            return const Center(
                              child: Text(
                                'No hay clientes disponibles',
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }

                          // Filtrar clientes según la búsqueda
                          final clientesFiltrados = searchQuery.isEmpty
                              ? clientes
                              : clientes.where((c) {
                                  return c.nombre.toLowerCase().contains(searchQuery) ||
                                      c.telefono.contains(searchQuery) ||
                                      c.email.toLowerCase().contains(searchQuery) ||
                                      c.direccion.toLowerCase().contains(searchQuery);
                                }).toList();

                          // Agrupar por letra inicial
                          final Map<String, List<Cliente>> clientesAgrupados = {};
                          for (var cliente in clientesFiltrados) {
                            final inicial = cliente.nombre.isNotEmpty
                                ? cliente.nombre[0].toUpperCase()
                                : '#';
                            if (!clientesAgrupados.containsKey(inicial)) {
                              clientesAgrupados[inicial] = [];
                            }
                            clientesAgrupados[inicial]!.add(cliente);
                          }

                          // Ordenar las letras
                          final letrasOrdenadas = clientesAgrupados.keys.toList()..sort();

                          // Ordenar cada grupo alfabéticamente
                          for (var letra in letrasOrdenadas) {
                            clientesAgrupados[letra]!.sort((a, b) =>
                                a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase()));
                          }

                          if (clientesFiltrados.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                                  const SizedBox(height: 16),
                                  Text(
                                    "No se encontraron clientes",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Stack(
                            children: [
                              ListView.builder(
                                controller: scrollController,
                                itemCount: letrasOrdenadas.length,
                                itemBuilder: (context, index) {
                                  final letra = letrasOrdenadas[index];
                                  final clientesLetra = clientesAgrupados[letra]!;

                                  if (!sectionKeys.containsKey(letra)) {
                                    sectionKeys[letra] = GlobalKey();
                                  }

                                  return Column(
                                    key: sectionKeys[letra],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Lista de clientes de esta letra
                                      ...clientesLetra.map((cliente) {
                                        final isSelected = clienteSeleccionado == cliente.id;
                                        return ListTile(
                                          leading: Icon(
                                            Icons.person,
                                            color: isSelected ? Colors.orange : Colors.grey[400],
                                          ),
                                          title: Text(
                                            cliente.nombre,
                                            style: TextStyle(
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: isSelected ? Colors.orange : Colors.white,
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(cliente.direccion),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(Icons.phone,
                                                      size: 14, color: Colors.grey[400]),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    cliente.telefono,
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Icon(Icons.email,
                                                      size: 14, color: Colors.grey[400]),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      cliente.email,
                                                      style: TextStyle(fontSize: 12),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          trailing: isSelected
                                              ? const Icon(Icons.check_circle, color: Colors.orange)
                                              : null,
                                          onTap: () {
                                            setDialogState(() {
                                              clienteSeleccionado = cliente.id;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ],
                                  );
                                },
                              ),
                              // Scroll rápido lateral
                              if (searchQuery.isEmpty && letrasOrdenadas.length > 3)
                                Positioned(
                                  right: 4,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: letrasOrdenadas.map((letra) {
                                          final isSelected = selectedLetter == letra;
                                          return GestureDetector(
                                            onTap: () => scrollToSection(letra),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? Colors.orange
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                letra,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: isSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.orange,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    // Nota discreta y botones
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          if (searchQuery.isEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 14,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Ordenados alfabéticamente',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  child: const Text('Cancelar'),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: clienteSeleccionado != null
                                      ? () {
                                          Navigator.of(dialogContext).pop(clienteSeleccionado);
                                        }
                                      : null,
                                  child: const Text('Seleccionar'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _mostrarDialogoAgregarTelefono() {
    final marcaController = TextEditingController();
    final modeloController = TextEditingController();
    final imeiController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final scaffoldContext = context;
    int? clienteIdSeleccionado;
    String? nombreClienteSeleccionado;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Agregar Nuevo Teléfono'),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: marcaController,
                        decoration: const InputDecoration(
                          labelText: 'Marca',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la marca';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: modeloController,
                        decoration: const InputDecoration(
                          labelText: 'Modelo',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el modelo';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: imeiController,
                        decoration: const InputDecoration(
                          labelText: 'IMEI',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.fingerprint),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el IMEI';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Selector de cliente con búsqueda
                      InkWell(
                        onTap: () async {
                          final idSeleccionado = await _mostrarDialogoSeleccionarCliente();
                          if (idSeleccionado != null) {
                            // Obtener el nombre del cliente seleccionado
                            final cliente = await fetchCliente(idSeleccionado);
                            setDialogState(() {
                              clienteIdSeleccionado = idSeleccionado;
                              nombreClienteSeleccionado = cliente?.nombre ?? 'Cliente seleccionado';
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.person, color: Colors.orange),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Cliente',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      nombreClienteSeleccionado ?? 'Seleccionar cliente',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: nombreClienteSeleccionado != null
                                            ? Colors.black87
                                            : Colors.grey,
                                        fontWeight: nombreClienteSeleccionado != null
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (clienteIdSeleccionado == null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Por favor seleccione un cliente',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate() && clienteIdSeleccionado != null) {
                      Navigator.of(dialogContext).pop();
                      
                      if (!mounted) return;
                      
                      showDialog(
                        context: scaffoldContext,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(color: Colors.orange),
                        ),
                      );

                      try {
                        final exito = await crearTelefono(
                          marcaController.text.trim(),
                          modeloController.text.trim(),
                          imeiController.text.trim(),
                          clienteIdSeleccionado!,
                        );

                        if (!mounted) return;
                        
                        Navigator.of(scaffoldContext).pop();

                        if (exito) {
                          ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                            const SnackBar(
                              content: Text('Teléfono creado exitosamente'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                          setState(() {
                            _telefonosFuture = fetchTelefonos();
                          });
                        }
                      } catch (e) {
                        if (!mounted) return;
                        
                        Navigator.of(scaffoldContext).pop();
                        ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                          SnackBar(
                            content: Text('Error al crear teléfono: ${e.toString()}'),
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 4),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teléfonos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarDialogoAgregarTelefono,
            tooltip: 'Agregar teléfono',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarTelefono,
        child: const Icon(Icons.add),
        tooltip: 'Agregar teléfono',
      ),
      body: FutureBuilder<List<Telefono>>(
        future: _telefonosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.orange));
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      "Error al cargar datos",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _telefonosFuture = fetchTelefonos();
                        });
                      },
                      child: const Text("Reintentar"),
                    ),
                  ],
                ),
              ),
            );
          }

          final telefonos = snapshot.data!;

          if (telefonos.isEmpty) {
            return const Center(
              child: Text("No hay teléfonos disponibles"),
            );
          }

          return FutureBuilder<List<dynamic>>(
            future: Future.wait([
              fetchClientes(),
              fetchReparaciones(),
            ]),
            builder: (context, relacionesSnapshot) {
              if (relacionesSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.orange));
              }

              final clientes = relacionesSnapshot.data?[0] as List<Cliente>? ?? [];
              final reparaciones = relacionesSnapshot.data?[1] as List<Reparacion>? ?? [];

              return ListView.builder(
                itemCount: telefonos.length,
                itemBuilder: (context, index) {
                  final telefono = telefonos[index];
                  final cliente = clientes.firstWhere(
                    (c) => c.id == telefono.clienteId,
                    orElse: () => Cliente(id: -1, nombre: 'No encontrado', telefono: '', direccion: '', email: ''),
                  );
                  final reparacionesTelefono = reparaciones.where((r) => r.telefonoId == telefono.id).toList();

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Text(
                          telefono.id.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        '${telefono.marca} ${telefono.modelo}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cliente: ${cliente.nombre}'),
                          Text('IMEI: ${telefono.imei}'),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Cliente:', style: TextStyle(fontWeight: FontWeight.bold)),
                              Card(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: ListTile(
                                  leading: const Icon(Icons.person, color: Colors.green),
                                  title: Text(cliente.nombre),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Tel: ${cliente.telefono}'),
                                      Text('Email: ${cliente.email}'),
                                      Text('Dir: ${cliente.direccion}'),
                                    ],
                                  ),
                                ),
                              ),
                              const Text('IMEI:', style: TextStyle(fontWeight: FontWeight.bold)),
                              Card(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: ListTile(
                                  leading: const Icon(Icons.fingerprint, color: Colors.teal),
                                  title: Text(telefono.imei),
                                ),
                              ),
                              const Text('Reparaciones:', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              if (reparacionesTelefono.isEmpty)
                                const Text('No hay reparaciones', style: TextStyle(color: Colors.grey))
                              else
                                ...reparacionesTelefono.map((r) => Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    leading: const Icon(Icons.build, color: Colors.red),
                                    title: Text(r.titulo),
                                    subtitle: Text('Costo: \$${r.coste.toStringAsFixed(2)} | Duración: ${_calcularDuracionEnHoras(r)} ${_calcularDuracionEnHoras(r) == 1 ? 'hora' : 'horas'}'),
                                  ),
                                )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// ==================== PANTALLA DE REPARACIONES ====================
class ReparacionesPage extends StatefulWidget {
  const ReparacionesPage({super.key});

  @override
  State<ReparacionesPage> createState() => _ReparacionesPageState();
}

class _ReparacionesPageState extends State<ReparacionesPage> {
  late Future<List<Reparacion>> _reparacionesFuture;
  final Map<String, TextEditingController> _searchControllers = {};
  final Map<String, String> _searchQueries = {};

  @override
  void initState() {
    super.initState();
    _reparacionesFuture = fetchReparaciones();
  }

  @override
  void dispose() {
    // Limpiar los controladores al destruir el widget
    for (var controller in _searchControllers.values) {
      controller.dispose();
    }
    _searchControllers.clear();
    _searchQueries.clear();
    super.dispose();
  }

  List<Map<String, dynamic>> _obtenerTelefonosConMultiplesReparaciones(
    List<Reparacion> reparaciones,
    List<Telefono> telefonos,
  ) {
    // Contar reparaciones por teléfono
    final Map<int, int> conteoPorTelefono = {};
    for (var reparacion in reparaciones) {
      conteoPorTelefono[reparacion.telefonoId] = 
          (conteoPorTelefono[reparacion.telefonoId] ?? 0) + 1;
    }

    // Filtrar teléfonos con más de 1 reparación
    final List<Map<String, dynamic>> telefonosMultiples = [];
    for (var telefono in telefonos) {
      final cantidad = conteoPorTelefono[telefono.id] ?? 0;
      if (cantidad > 1) {
        telefonosMultiples.add({
          'telefono': telefono,
          'cantidad': cantidad,
        });
      }
    }

    // Ordenar por cantidad de reparaciones (mayor a menor)
    telefonosMultiples.sort((a, b) => b['cantidad'].compareTo(a['cantidad']));
    
    return telefonosMultiples;
  }

  List<Reparacion> _filtrarReparacionesPorEstado(List<Reparacion> reparaciones, String estado) {
    return reparaciones.where((r) => r.estado.toLowerCase() == estado.toLowerCase()).toList();
  }

  Widget _buildCardTelefonosMultiplesReparaciones(
    List<Map<String, dynamic>> telefonosMultiples,
  ) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: Colors.grey[900],
      child: ExpansionTile(
        leading: const Icon(Icons.phone_android, color: Colors.orange, size: 32),
        title: const Text(
          'Teléfonos con múltiples reparaciones',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          telefonosMultiples.isEmpty 
            ? 'No hay teléfonos con múltiples reparaciones'
            : '${telefonosMultiples.length} ${telefonosMultiples.length == 1 ? 'teléfono encontrado' : 'teléfonos encontrados'}',
          style: TextStyle(color: Colors.grey[400]),
        ),
        children: telefonosMultiples.isEmpty 
          ? [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'No hay teléfonos con más de 1 reparación en el historial',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              ),
            ]
          : [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: telefonosMultiples.map((item) {
                final telefono = item['telefono'] as Telefono;
                final cantidad = item['cantidad'] as int;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(
                          cantidad.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${telefono.marca} ${telefono.modelo}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'IMEI: ${telefono.imei}',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$cantidad ${cantidad == 1 ? 'reparación' : 'reparaciones'} en el historial',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardReparacionesPorEstado(
    String titulo,
    List<Reparacion> reparaciones,
    Color color,
    List<Taller> talleres,
    List<Sucursal> sucursales,
    List<Telefono> telefonos,
    List<Tecnico> tecnicos,
    List<Cliente> clientes,
  ) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: Colors.grey[900],
      child: ExpansionTile(
        leading: Icon(Icons.build, color: color, size: 32),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          reparaciones.isEmpty 
            ? 'No hay reparaciones ${titulo.toLowerCase()}'
            : '${reparaciones.length} ${reparaciones.length == 1 ? 'reparación encontrada' : 'reparaciones encontradas'}',
          style: TextStyle(color: Colors.grey[400]),
        ),
        children: reparaciones.isEmpty 
          ? [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'No hay reparaciones ${titulo.toLowerCase()}',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              ),
            ]
          : [
              StatefulBuilder(
                builder: (context, setState) {
                  // Usar un Map para almacenar el estado de búsqueda por cada card
                  final searchKey = titulo; // Usar el título como clave única
                  if (!_searchControllers.containsKey(searchKey)) {
                    _searchControllers[searchKey] = TextEditingController();
                    _searchQueries[searchKey] = '';
                  }
                  
                  final searchController = _searchControllers[searchKey]!;
                  String searchQuery = _searchQueries[searchKey]!;

                  // Función para filtrar reparaciones con búsqueda múltiple
                  List<Reparacion> reparacionesFiltradas = reparaciones;
                  
                  if (searchQuery.isNotEmpty) {
                    final queryLower = searchQuery.toLowerCase().trim();
                    final queryInt = int.tryParse(searchQuery.trim());
                    
                    // Si la búsqueda es solo numérica, primero intentar buscar solo por ID exacto
                    if (queryInt != null && searchQuery.trim() == queryInt.toString()) {
                      final resultadosExactos = reparaciones.where((reparacion) {
                        return reparacion.id == queryInt;
                      }).toList();
                      
                      // Si encontramos resultados exactos, devolver solo esos
                      if (resultadosExactos.isNotEmpty) {
                        reparacionesFiltradas = resultadosExactos;
                      } else {
                        // Si no hay resultados exactos, buscar en todos los campos
                        reparacionesFiltradas = reparaciones.where((reparacion) {
                          // Buscar por ID de reparación (coincidencia parcial)
                          if (reparacion.id.toString().contains(queryLower)) {
                            return true;
                          }
                          
                          // Buscar por título de reparación
                          if (reparacion.titulo.toLowerCase().contains(queryLower)) {
                            return true;
                          }
                          
                          // Buscar por IMEI del teléfono
                          final telefono = telefonos.firstWhere(
                            (t) => t.id == reparacion.telefonoId,
                            orElse: () => Telefono(id: -1, marca: '', modelo: '', clienteId: -1, imei: ''),
                          );
                          if (telefono.imei.isNotEmpty && telefono.imei.toLowerCase().contains(queryLower)) {
                            return true;
                          }
                          
                          // Buscar por nombre y teléfono del cliente
                          final cliente = clientes.firstWhere(
                            (c) => c.id == telefono.clienteId,
                            orElse: () => Cliente(id: -1, nombre: '', telefono: '', direccion: '', email: ''),
                          );
                          if (cliente.nombre.toLowerCase().contains(queryLower) ||
                              cliente.telefono.contains(queryLower)) {
                            return true;
                          }
                          
                          // Buscar por fecha de ingreso
                          if (reparacion.fechaIngreso.toLowerCase().contains(queryLower)) {
                            return true;
                          }
                          
                          return false;
                        }).toList();
                      }
                    } else {
                      // Búsqueda múltiple en todos los campos (no numérica o numérica parcial)
                      reparacionesFiltradas = reparaciones.where((reparacion) {
                        // Buscar por ID de reparación (coincidencia parcial)
                        if (reparacion.id.toString().contains(queryLower)) {
                          return true;
                        }
                        
                        // Buscar por título de reparación
                        if (reparacion.titulo.toLowerCase().contains(queryLower)) {
                          return true;
                        }
                        
                        // Buscar por IMEI del teléfono
                        final telefono = telefonos.firstWhere(
                          (t) => t.id == reparacion.telefonoId,
                          orElse: () => Telefono(id: -1, marca: '', modelo: '', clienteId: -1, imei: ''),
                        );
                        if (telefono.imei.isNotEmpty && telefono.imei.toLowerCase().contains(queryLower)) {
                          return true;
                        }
                        
                        // Buscar por nombre y teléfono del cliente
                        final cliente = clientes.firstWhere(
                          (c) => c.id == telefono.clienteId,
                          orElse: () => Cliente(id: -1, nombre: '', telefono: '', direccion: '', email: ''),
                        );
                        if (cliente.nombre.toLowerCase().contains(queryLower) ||
                            cliente.telefono.contains(queryLower)) {
                          return true;
                        }
                        
                        // Buscar por fecha de ingreso
                        if (reparacion.fechaIngreso.toLowerCase().contains(queryLower)) {
                          return true;
                        }
                        
                        return false;
                      }).toList();
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Barra de búsqueda
                        TextField(
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {
                              _searchQueries[searchKey] = value;
                              searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Buscar por IMEI, teléfono del cliente, nombre, ID o fecha de ingreso...",
                            prefixIcon: const Icon(Icons.search, color: Colors.orange),
                            suffixIcon: searchQuery.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      searchController.clear();
                                      setState(() {
                                        _searchQueries[searchKey] = '';
                                        searchQuery = '';
                                      });
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey.shade700),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey.shade700),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.orange, width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.grey[800],
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        if (searchQuery.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            '${reparacionesFiltradas.length} ${reparacionesFiltradas.length == 1 ? 'reparación encontrada' : 'reparaciones encontradas'}',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                        const SizedBox(height: 16),
                        // Lista de reparaciones filtradas
                        if (reparacionesFiltradas.isEmpty && searchQuery.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: Text(
                                'No se encontraron reparaciones con ese criterio de búsqueda',
                                style: TextStyle(color: Colors.grey[400]),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        else
                          ...reparacionesFiltradas.map((reparacion) {
                    final taller = talleres.firstWhere(
                      (t) => t.id == reparacion.tallerId,
                      orElse: () => Taller(id: -1, nombre: 'No encontrado', especialidad: '', sucursalId: -1),
                    );
                    final sucursal = sucursales.firstWhere(
                      (s) => s.id == taller.sucursalId,
                      orElse: () => Sucursal(id: -1, nombre: 'No encontrada', direccion: '', telefono: ''),
                    );
                    final telefono = telefonos.firstWhere(
                      (t) => t.id == reparacion.telefonoId,
                      orElse: () => Telefono(id: -1, marca: '', modelo: '', clienteId: -1, imei: ''),
                    );
                    final cliente = clientes.firstWhere(
                      (c) => c.id == telefono.clienteId,
                      orElse: () => Cliente(id: -1, nombre: '', telefono: '', direccion: '', email: ''),
                    );
                    final tecnico = tecnicos.firstWhere(
                      (t) => t.id == reparacion.tecnicoId,
                      orElse: () => Tecnico(id: -1, nombre: 'No encontrado', especialidad: '', telefono: '', tallerId: -1),
                    );
                    final duracionHoras = _calcularDuracionEnHoras(reparacion);

                    Color estadoColor = Colors.grey;
                    if (reparacion.estado == 'pendiente') {
                      estadoColor = Colors.orange;
                    } else if (reparacion.estado == 'en progreso') {
                      estadoColor = Colors.blue;
                    } else if (reparacion.estado == 'completada') {
                      estadoColor = Colors.green;
                    } else if (reparacion.estado == 'cancelada') {
                      estadoColor = Colors.red;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Card(
                        color: Colors.grey[800],
                        child: ExpansionTile(
                          leading: CircleAvatar(
                            backgroundColor: color,
                            child: Text(
                              reparacion.id.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            reparacion.titulo,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Costo: \$${reparacion.coste.toStringAsFixed(2)} | Duración: $duracionHoras ${duracionHoras == 1 ? 'hora' : 'horas'}'),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: estadoColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: estadoColor),
                                    ),
                                    child: Text(
                                      reparacion.estado.toUpperCase(),
                                      style: TextStyle(
                                        color: estadoColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('ID de Reparación:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.tag, color: Colors.orange),
                                      title: Text('Reparación #${reparacion.id}'),
                                    ),
                                  ),
                                  const Text('Descripción:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(reparacion.descripcion),
                                    ),
                                  ),
                                  const Text('Técnico asignado:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.engineering, color: Colors.purple),
                                      title: Text(tecnico.nombre),
                                      subtitle: Text('Especialidad: ${tecnico.especialidad} | Tel: ${tecnico.telefono}'),
                                    ),
                                  ),
                                  const Text('Taller:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.hardware, color: Colors.orange),
                                      title: Text(taller.nombre),
                                      subtitle: Text('Especialidad: ${taller.especialidad}'),
                                    ),
                                  ),
                                  const Text('Sucursal del taller:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.store, color: Colors.orange),
                                      title: Text(sucursal.nombre),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(sucursal.direccion),
                                          Text('Tel: ${sucursal.telefono}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Text('Cliente:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.person, color: Colors.blue),
                                      title: Text(cliente.nombre),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Teléfono: ${cliente.telefono}'),
                                          if (cliente.email.isNotEmpty) Text('Email: ${cliente.email}'),
                                          if (cliente.direccion.isNotEmpty) Text('Dirección: ${cliente.direccion}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Text('Teléfono reparado:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.phone_android, color: Colors.teal),
                                      title: Text('${telefono.marca} ${telefono.modelo}'),
                                      subtitle: Text('IMEI: ${telefono.imei}'),
                                    ),
                                  ),
                                  const Text('Fecha de Ingreso:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: const Icon(Icons.calendar_today, color: Colors.orange),
                                      title: Text(reparacion.fechaIngreso),
                                    ),
                                  ),
                                  if (reparacion.fechaEntrega.isNotEmpty) ...[
                                    const Text('Fecha de Entrega:', style: TextStyle(fontWeight: FontWeight.bold)),
                                    Card(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: ListTile(
                                        leading: const Icon(Icons.event_available, color: Colors.green),
                                        title: Text(reparacion.fechaEntrega),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                          }).toList(),
                      ],
                    ),
                  );
                },
              ),
            ],
      ),
    );
  }

  int _calcularDuracionEnHoras(Reparacion reparacion) {
    try {
      if (reparacion.fechaIngreso.isEmpty) {
        return 0;
      }
      
      final fechaIngreso = DateTime.parse(reparacion.fechaIngreso);
      DateTime fechaEntrega;
      
      if (reparacion.fechaEntrega.isNotEmpty) {
        fechaEntrega = DateTime.parse(reparacion.fechaEntrega);
      } else {
        fechaEntrega = DateTime.now();
      }
      
      final diferencia = fechaEntrega.difference(fechaIngreso);
      final horas = diferencia.inHours;
      return horas < 0 ? 0 : horas;
    } catch (e) {
      debugPrint('Error al calcular duración: $e');
      return 0;
    }
  }

  Future<List<Reparacion>> fetchReparaciones() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/reparaciones'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado. Verifica la conexión a internet y que la API esté disponible en $baseUrl');
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Reparacion> reparaciones = [];
        for (var json in jsonList) {
          try {
            reparaciones.add(Reparacion.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear reparación: $e, JSON: $json');
          }
        }
        return reparaciones;
      } else {
        throw Exception("Error al cargar reparaciones: ${response.statusCode}");
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception(
          'Error de CORS: La API no permite solicitudes desde el navegador.\n\n'
          'Solución: Ejecuta la app en modo móvil o desktop:\n'
          '• flutter run -d windows (Windows)\n'
          '• flutter run -d macos (macOS)\n'
          '• flutter run -d linux (Linux)'
        );
      }
      
      if (errorString.contains('Connection refused') || 
          errorString.contains('ERR_CONNECTION_RESET') ||
          errorString.contains('Failed host lookup') ||
          errorString.contains('ERR_FAILED')) {
        throw Exception('No se puede conectar al servidor. Verifica tu conexión a internet y que la API esté disponible en $baseUrl');
      }
      rethrow;
    }
  }

  Future<List<Cliente>> fetchClientes() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    final response = await http.get(
      Uri.parse('$baseUrl/api/clientes'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<Cliente> clientes = [];
      for (var json in jsonList) {
        try {
          clientes.add(Cliente.fromJson(json as Map<String, dynamic>));
        } catch (e) {
          debugPrint('Error al parsear cliente en ReparacionesPage: $e, JSON: $json');
        }
      }
      return clientes;
    }
    return [];
  }

  Future<List<dynamic>> fetchRelaciones() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    final results = await Future.wait([
      http.get(Uri.parse('$baseUrl/api/talleres'), headers: {'Content-Type': 'application/json', 'Accept': 'application/json'}).timeout(const Duration(seconds: 10)),
      http.get(Uri.parse('$baseUrl/api/sucursales'), headers: {'Content-Type': 'application/json', 'Accept': 'application/json'}).timeout(const Duration(seconds: 10)),
      http.get(Uri.parse('$baseUrl/api/telefonos'), headers: {'Content-Type': 'application/json', 'Accept': 'application/json'}).timeout(const Duration(seconds: 10)),
    ]);

    final List<Taller> talleres = [];
    if (results[0].statusCode == 200) {
      try {
        final List<dynamic> jsonList = jsonDecode(results[0].body);
        for (var json in jsonList) {
          try {
            talleres.add(Taller.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear taller en fetchRelaciones: $e, JSON: $json');
          }
        }
      } catch (e) {
        debugPrint('Error al parsear talleres en fetchRelaciones: $e');
      }
    }
    
    final List<Sucursal> sucursales = [];
    if (results[1].statusCode == 200) {
      try {
        final List<dynamic> jsonList = jsonDecode(results[1].body);
        for (var json in jsonList) {
          try {
            sucursales.add(Sucursal.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear sucursal en fetchRelaciones: $e, JSON: $json');
          }
        }
      } catch (e) {
        debugPrint('Error al parsear sucursales en fetchRelaciones: $e');
      }
    }
    
    final List<Telefono> telefonos = [];
    if (results[2].statusCode == 200) {
      try {
        final List<dynamic> jsonList = jsonDecode(results[2].body);
        for (var json in jsonList) {
          try {
            telefonos.add(Telefono.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear teléfono en fetchRelaciones: $e, JSON: $json');
          }
        }
      } catch (e) {
        debugPrint('Error al parsear teléfonos en fetchRelaciones: $e');
      }
    }

    return [talleres, sucursales, telefonos];
  }

  Future<List<Tecnico>> fetchTecnicos() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/tecnicos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Tecnico> tecnicos = [];
        for (var json in jsonList) {
          try {
            tecnicos.add(Tecnico.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear técnico: $e, JSON: $json');
          }
        }
        return tecnicos;
      } else {
        throw Exception("Error al cargar técnicos: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error al cargar técnicos: ${e.toString()}');
    }
  }

  Future<List<Taller>> fetchTalleres() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/talleres'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Taller> talleres = [];
        for (var json in jsonList) {
          try {
            talleres.add(Taller.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear taller: $e, JSON: $json');
          }
        }
        return talleres;
      } else {
        throw Exception("Error al cargar talleres: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error al cargar talleres: ${e.toString()}');
    }
  }

  Future<List<Telefono>> fetchTelefonos() async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/telefonos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Telefono> telefonos = [];
        for (var json in jsonList) {
          try {
            telefonos.add(Telefono.fromJson(json as Map<String, dynamic>));
          } catch (e) {
            debugPrint('Error al parsear teléfono: $e, JSON: $json');
          }
        }
        return telefonos;
      } else {
        throw Exception("Error al cargar teléfonos: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error al cargar teléfonos: ${e.toString()}');
    }
  }

  Future<Taller?> fetchTaller(int tallerId) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/talleres/$tallerId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Taller.fromJson(json as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<Telefono?> fetchTelefono(int telefonoId) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/telefonos/$telefonoId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Telefono.fromJson(json as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<Tecnico?> fetchTecnico(int tecnicoId) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/tecnicos/$tecnicoId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Tecnico.fromJson(json as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> crearReparacion(
    String titulo,
    String descripcion,
    int duracion,
    double coste,
    int tallerId,
    int telefonoId,
    int tecnicoId,
    String fechaIngreso,
    String fechaEntrega,
    String estado,
  ) async {
    final baseUrl = 'https://v0-mobile-repair-api.vercel.app';
    
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/reparaciones'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'titulo': titulo,
          'descripcion': descripcion,
          'duracion': duracion,
          'costo': coste,
          'taller_id': tallerId,
          'telefono_id': telefonoId,
          'tecnico_id': tecnicoId,
          'fecha_ingreso': fechaIngreso,
          'fecha_entrega': fechaEntrega,
          'estado': estado,
        }),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Tiempo de espera agotado');
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        String errorMessage = 'Error al crear reparación: ${response.statusCode}';
        try {
          final errorBody = jsonDecode(response.body);
          if (errorBody is Map && errorBody.containsKey('message')) {
            errorMessage = 'Error: ${errorBody['message']}';
          } else if (errorBody is Map && errorBody.containsKey('error')) {
            errorMessage = 'Error: ${errorBody['error']}';
          } else {
            errorMessage = 'Error ${response.statusCode}: ${response.body}';
          }
        } catch (_) {
          errorMessage = 'Error ${response.statusCode}: ${response.body}';
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorString = e.toString();
      
      if (errorString.contains('CORS') || 
          errorString.contains('Access-Control-Allow-Origin') ||
          errorString.contains('blocked by CORS policy')) {
        throw Exception('Error de CORS al crear reparación');
      }
      rethrow;
    }
  }

  Future<int?> _mostrarDialogoSeleccionarTaller() async {
    final TextEditingController searchController = TextEditingController();
    String searchQuery = '';
    Timer? debounceTimer;
    String? selectedLetter;
    final ScrollController scrollController = ScrollController();
    final Map<String, GlobalKey> sectionKeys = {};
    int? tallerSeleccionado;

    return showDialog<int>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            void onSearchChanged(String value) {
              debounceTimer?.cancel();
              debounceTimer = Timer(const Duration(milliseconds: 300), () {
                setDialogState(() {
                  searchQuery = value.toLowerCase();
                });
              });
            }

            void scrollToSection(String letter) {
              if (sectionKeys.containsKey(letter)) {
                final key = sectionKeys[letter]!;
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setDialogState(() {
                  selectedLetter = letter;
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  setDialogState(() {
                    selectedLetter = null;
                  });
                });
              }
            }

            return Dialog(
              backgroundColor: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.hardware, color: Colors.orange),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Seleccionar Taller',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(dialogContext).pop(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: searchController,
                        onChanged: onSearchChanged,
                        decoration: InputDecoration(
                          hintText: "Buscar talleres...",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    searchController.clear();
                                    setDialogState(() {
                                      searchQuery = '';
                                    });
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.orange, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.grey[900],
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          labelStyle: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<Taller>>(
                        future: fetchTalleres(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator(color: Colors.orange));
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error al cargar talleres: ${snapshot.error}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }

                          final talleres = snapshot.data ?? [];

                          if (talleres.isEmpty) {
                            return const Center(
                              child: Text(
                                'No hay talleres disponibles',
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }

                          final talleresFiltrados = searchQuery.isEmpty
                              ? talleres
                              : talleres.where((t) {
                                  return t.nombre.toLowerCase().contains(searchQuery) ||
                                      t.especialidad.toLowerCase().contains(searchQuery);
                                }).toList();

                          final Map<String, List<Taller>> talleresAgrupados = {};
                          for (var taller in talleresFiltrados) {
                            final inicial = taller.nombre.isNotEmpty
                                ? taller.nombre[0].toUpperCase()
                                : '#';
                            if (!talleresAgrupados.containsKey(inicial)) {
                              talleresAgrupados[inicial] = [];
                            }
                            talleresAgrupados[inicial]!.add(taller);
                          }

                          final letrasOrdenadas = talleresAgrupados.keys.toList()..sort();

                          for (var letra in letrasOrdenadas) {
                            talleresAgrupados[letra]!.sort((a, b) =>
                                a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase()));
                          }

                          if (talleresFiltrados.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                                  const SizedBox(height: 16),
                                  Text(
                                    "No se encontraron talleres",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Stack(
                            children: [
                              ListView.builder(
                                controller: scrollController,
                                itemCount: letrasOrdenadas.length,
                                itemBuilder: (context, index) {
                                  final letra = letrasOrdenadas[index];
                                  final talleresLetra = talleresAgrupados[letra]!;

                                  if (!sectionKeys.containsKey(letra)) {
                                    sectionKeys[letra] = GlobalKey();
                                  }

                                  return Column(
                                    key: sectionKeys[letra],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        width: double.infinity,
                                        color: Colors.grey.shade200,
                                        child: Text(
                                          letra,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      ...talleresLetra.map((taller) {
                                        final isSelected = tallerSeleccionado == taller.id;
                                        return ListTile(
                                          leading: Icon(
                                            Icons.hardware,
                                            color: isSelected ? Colors.orange : Colors.grey[400],
                                          ),
                                          title: Text(
                                            taller.nombre,
                                            style: TextStyle(
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: isSelected ? Colors.orange : Colors.white,
                                            ),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Icon(Icons.build,
                                                  size: 14, color: Colors.grey[400]),
                                              const SizedBox(width: 4),
                                              Text(
                                                taller.especialidad,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          trailing: isSelected
                                              ? const Icon(Icons.check_circle, color: Colors.orange)
                                              : null,
                                          onTap: () {
                                            setDialogState(() {
                                              tallerSeleccionado = taller.id;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ],
                                  );
                                },
                              ),
                              if (searchQuery.isEmpty && letrasOrdenadas.length > 3)
                                Positioned(
                                  right: 4,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: letrasOrdenadas.map((letra) {
                                          final isSelected = selectedLetter == letra;
                                          return GestureDetector(
                                            onTap: () => scrollToSection(letra),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? Colors.orange
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                letra,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: isSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.orange,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          if (searchQuery.isEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 14,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Ordenados alfabéticamente',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.of(dialogContext).pop(),
                                child: const Text('Cancelar'),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: tallerSeleccionado != null
                                    ? () {
                                        Navigator.of(dialogContext).pop(tallerSeleccionado);
                                      }
                                    : null,
                                child: const Text('Seleccionar'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<int?> _mostrarDialogoSeleccionarTelefono() async {
    final TextEditingController searchController = TextEditingController();
    String searchQuery = '';
    Timer? debounceTimer;
    String? selectedLetter;
    final ScrollController scrollController = ScrollController();
    final Map<String, GlobalKey> sectionKeys = {};
    int? telefonoSeleccionado;

    return showDialog<int>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            void onSearchChanged(String value) {
              debounceTimer?.cancel();
              debounceTimer = Timer(const Duration(milliseconds: 300), () {
                setDialogState(() {
                  searchQuery = value.toLowerCase();
                });
              });
            }

            void scrollToSection(String letter) {
              if (sectionKeys.containsKey(letter)) {
                final key = sectionKeys[letter]!;
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setDialogState(() {
                  selectedLetter = letter;
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  setDialogState(() {
                    selectedLetter = null;
                  });
                });
              }
            }

            return Dialog(
              backgroundColor: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.phone_android, color: Colors.orange),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Seleccionar Teléfono',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(dialogContext).pop(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: searchController,
                        onChanged: onSearchChanged,
                        decoration: InputDecoration(
                          hintText: "Buscar teléfonos...",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    searchController.clear();
                                    setDialogState(() {
                                      searchQuery = '';
                                    });
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.orange, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.grey[900],
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          labelStyle: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<Telefono>>(
                        future: fetchTelefonos(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator(color: Colors.orange));
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error al cargar teléfonos: ${snapshot.error}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }

                          final telefonos = snapshot.data ?? [];

                          if (telefonos.isEmpty) {
                            return const Center(
                              child: Text(
                                'No hay teléfonos disponibles',
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }

                          final telefonosFiltrados = searchQuery.isEmpty
                              ? telefonos
                              : telefonos.where((t) {
                                  return t.marca.toLowerCase().contains(searchQuery) ||
                                      t.modelo.toLowerCase().contains(searchQuery) ||
                                      t.imei.contains(searchQuery);
                                }).toList();

                          final Map<String, List<Telefono>> telefonosAgrupados = {};
                          for (var telefono in telefonosFiltrados) {
                            final inicial = telefono.marca.isNotEmpty
                                ? telefono.marca[0].toUpperCase()
                                : '#';
                            if (!telefonosAgrupados.containsKey(inicial)) {
                              telefonosAgrupados[inicial] = [];
                            }
                            telefonosAgrupados[inicial]!.add(telefono);
                          }

                          final letrasOrdenadas = telefonosAgrupados.keys.toList()..sort();

                          for (var letra in letrasOrdenadas) {
                            telefonosAgrupados[letra]!.sort((a, b) =>
                                a.marca.toLowerCase().compareTo(b.marca.toLowerCase()));
                          }

                          if (telefonosFiltrados.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                                  const SizedBox(height: 16),
                                  Text(
                                    "No se encontraron teléfonos",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Stack(
                            children: [
                              ListView.builder(
                                controller: scrollController,
                                itemCount: letrasOrdenadas.length,
                                itemBuilder: (context, index) {
                                  final letra = letrasOrdenadas[index];
                                  final telefonosLetra = telefonosAgrupados[letra]!;

                                  if (!sectionKeys.containsKey(letra)) {
                                    sectionKeys[letra] = GlobalKey();
                                  }

                                  return Column(
                                    key: sectionKeys[letra],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        width: double.infinity,
                                        color: Colors.grey.shade200,
                                        child: Text(
                                          letra,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      ...telefonosLetra.map((telefono) {
                                        final isSelected = telefonoSeleccionado == telefono.id;
                                        return ListTile(
                                          leading: Icon(
                                            Icons.phone_android,
                                            color: isSelected ? Colors.orange : Colors.grey[400],
                                          ),
                                          title: Text(
                                            '${telefono.marca} ${telefono.modelo}',
                                            style: TextStyle(
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: isSelected ? Colors.orange : Colors.white,
                                            ),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Icon(Icons.fingerprint,
                                                  size: 14, color: Colors.grey[400]),
                                              const SizedBox(width: 4),
                                              Text(
                                                'IMEI: ${telefono.imei}',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          trailing: isSelected
                                              ? const Icon(Icons.check_circle, color: Colors.orange)
                                              : null,
                                          onTap: () {
                                            setDialogState(() {
                                              telefonoSeleccionado = telefono.id;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ],
                                  );
                                },
                              ),
                              if (searchQuery.isEmpty && letrasOrdenadas.length > 3)
                                Positioned(
                                  right: 4,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: letrasOrdenadas.map((letra) {
                                          final isSelected = selectedLetter == letra;
                                          return GestureDetector(
                                            onTap: () => scrollToSection(letra),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? Colors.orange
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                letra,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: isSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.orange,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          if (searchQuery.isEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 14,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Ordenados alfabéticamente',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  child: const Text('Cancelar'),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: telefonoSeleccionado != null
                                      ? () {
                                          Navigator.of(dialogContext).pop(telefonoSeleccionado);
                                        }
                                      : null,
                                  child: const Text('Seleccionar'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<int?> _mostrarDialogoSeleccionarTecnico() async {
    final TextEditingController searchController = TextEditingController();
    String searchQuery = '';
    Timer? debounceTimer;
    String? selectedLetter;
    final ScrollController scrollController = ScrollController();
    final Map<String, GlobalKey> sectionKeys = {};
    int? tecnicoSeleccionado;

    return showDialog<int>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            void onSearchChanged(String value) {
              debounceTimer?.cancel();
              debounceTimer = Timer(const Duration(milliseconds: 300), () {
                setDialogState(() {
                  searchQuery = value.toLowerCase();
                });
              });
            }

            void scrollToSection(String letter) {
              if (sectionKeys.containsKey(letter)) {
                final key = sectionKeys[letter]!;
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setDialogState(() {
                  selectedLetter = letter;
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  setDialogState(() {
                    selectedLetter = null;
                  });
                });
              }
            }

            return Dialog(
              backgroundColor: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.engineering, color: Colors.orange),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Seleccionar Técnico',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(dialogContext).pop(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: searchController,
                        onChanged: onSearchChanged,
                        decoration: InputDecoration(
                          hintText: "Buscar técnicos...",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    searchController.clear();
                                    setDialogState(() {
                                      searchQuery = '';
                                    });
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade700),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.orange, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.grey[900],
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          labelStyle: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<Tecnico>>(
                        future: fetchTecnicos(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator(color: Colors.orange));
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Error al cargar técnicos: ${snapshot.error}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          }

                          final tecnicos = snapshot.data ?? [];

                          if (tecnicos.isEmpty) {
                            return const Center(
                              child: Text(
                                'No hay técnicos disponibles',
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }

                          final tecnicosFiltrados = searchQuery.isEmpty
                              ? tecnicos
                              : tecnicos.where((t) {
                                  return t.nombre.toLowerCase().contains(searchQuery) ||
                                      t.especialidad.toLowerCase().contains(searchQuery) ||
                                      t.telefono.contains(searchQuery);
                                }).toList();

                          final Map<String, List<Tecnico>> tecnicosAgrupados = {};
                          for (var tecnico in tecnicosFiltrados) {
                            final inicial = tecnico.nombre.isNotEmpty
                                ? tecnico.nombre[0].toUpperCase()
                                : '#';
                            if (!tecnicosAgrupados.containsKey(inicial)) {
                              tecnicosAgrupados[inicial] = [];
                            }
                            tecnicosAgrupados[inicial]!.add(tecnico);
                          }

                          final letrasOrdenadas = tecnicosAgrupados.keys.toList()..sort();

                          for (var letra in letrasOrdenadas) {
                            tecnicosAgrupados[letra]!.sort((a, b) =>
                                a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase()));
                          }

                          if (tecnicosFiltrados.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                                  const SizedBox(height: 16),
                                  Text(
                                    "No se encontraron técnicos",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return Stack(
                            children: [
                              ListView.builder(
                                controller: scrollController,
                                itemCount: letrasOrdenadas.length,
                                itemBuilder: (context, index) {
                                  final letra = letrasOrdenadas[index];
                                  final tecnicosLetra = tecnicosAgrupados[letra]!;

                                  if (!sectionKeys.containsKey(letra)) {
                                    sectionKeys[letra] = GlobalKey();
                                  }

                                  return Column(
                                    key: sectionKeys[letra],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        width: double.infinity,
                                        color: Colors.grey.shade200,
                                        child: Text(
                                          letra,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      ...tecnicosLetra.map((tecnico) {
                                        final isSelected = tecnicoSeleccionado == tecnico.id;
                                        return ListTile(
                                          leading: Icon(
                                            Icons.engineering,
                                            color: isSelected ? Colors.orange : Colors.grey[400],
                                          ),
                                          title: Text(
                                            tecnico.nombre,
                                            style: TextStyle(
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: isSelected ? Colors.orange : Colors.white,
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.build,
                                                      size: 14, color: Colors.grey[400]),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    tecnico.especialidad,
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(Icons.phone,
                                                      size: 14, color: Colors.grey[400]),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    tecnico.telefono,
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          trailing: isSelected
                                              ? const Icon(Icons.check_circle, color: Colors.orange)
                                              : null,
                                          onTap: () {
                                            setDialogState(() {
                                              tecnicoSeleccionado = tecnico.id;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ],
                                  );
                                },
                              ),
                              if (searchQuery.isEmpty && letrasOrdenadas.length > 3)
                                Positioned(
                                  right: 4,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: letrasOrdenadas.map((letra) {
                                          final isSelected = selectedLetter == letra;
                                          return GestureDetector(
                                            onTap: () => scrollToSection(letra),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? Colors.orange
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                letra,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: isSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.orange,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          if (searchQuery.isEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 14,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Ordenados alfabéticamente',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  child: const Text('Cancelar'),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: tecnicoSeleccionado != null
                                      ? () {
                                          Navigator.of(dialogContext).pop(tecnicoSeleccionado);
                                        }
                                      : null,
                                  child: const Text('Seleccionar'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _mostrarDialogoAgregarReparacion() {
    final tituloController = TextEditingController();
    final descripcionController = TextEditingController();
    final costeController = TextEditingController();
    final fechaIngresoController = TextEditingController();
    final fechaEntregaController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final scaffoldContext = context;
    int? tallerIdSeleccionado;
    int? telefonoIdSeleccionado;
    int? tecnicoIdSeleccionado;
    String? estadoSeleccionado;
    DateTime? fechaIngresoSeleccionada;
    DateTime? fechaEntregaSeleccionada;
    String? nombreTallerSeleccionado;
    String? nombreTelefonoSeleccionado;
    String? nombreTecnicoSeleccionado;

    final estados = ['pendiente', 'a retirar', 'entregado'];

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Agregar Nueva Reparación'),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: tituloController,
                        decoration: const InputDecoration(
                          labelText: 'Título',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.title),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el título';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: descripcionController,
                        decoration: const InputDecoration(
                          labelText: 'Descripción',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.description),
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la descripción';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: costeController,
                        decoration: const InputDecoration(
                          labelText: 'Coste',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el coste';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Por favor ingrese un número válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Selector de taller con búsqueda
                      InkWell(
                        onTap: () async {
                          final idSeleccionado = await _mostrarDialogoSeleccionarTaller();
                          if (idSeleccionado != null) {
                            final taller = await fetchTaller(idSeleccionado);
                            setDialogState(() {
                              tallerIdSeleccionado = idSeleccionado;
                              nombreTallerSeleccionado = taller?.nombre ?? 'Taller seleccionado';
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.hardware, color: Colors.orange),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Taller',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      nombreTallerSeleccionado ?? 'Seleccionar taller',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: nombreTallerSeleccionado != null
                                            ? Colors.black87
                                            : Colors.grey,
                                        fontWeight: nombreTallerSeleccionado != null
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (tallerIdSeleccionado == null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Por favor seleccione un taller',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      // Selector de teléfono con búsqueda
                      InkWell(
                        onTap: () async {
                          final idSeleccionado = await _mostrarDialogoSeleccionarTelefono();
                          if (idSeleccionado != null) {
                            final telefono = await fetchTelefono(idSeleccionado);
                            setDialogState(() {
                              telefonoIdSeleccionado = idSeleccionado;
                              nombreTelefonoSeleccionado = telefono != null
                                  ? '${telefono.marca} ${telefono.modelo}'
                                  : 'Teléfono seleccionado';
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.phone_android, color: Colors.orange),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Teléfono',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      nombreTelefonoSeleccionado ?? 'Seleccionar teléfono',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: nombreTelefonoSeleccionado != null
                                            ? Colors.black87
                                            : Colors.grey,
                                        fontWeight: nombreTelefonoSeleccionado != null
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (telefonoIdSeleccionado == null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Por favor seleccione un teléfono',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      // Selector de técnico con búsqueda
                      InkWell(
                        onTap: () async {
                          final idSeleccionado = await _mostrarDialogoSeleccionarTecnico();
                          if (idSeleccionado != null) {
                            final tecnico = await fetchTecnico(idSeleccionado);
                            setDialogState(() {
                              tecnicoIdSeleccionado = idSeleccionado;
                              nombreTecnicoSeleccionado = tecnico?.nombre ?? 'Técnico seleccionado';
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.engineering, color: Colors.orange),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Técnico',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      nombreTecnicoSeleccionado ?? 'Seleccionar técnico',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: nombreTecnicoSeleccionado != null
                                            ? Colors.black87
                                            : Colors.grey,
                                        fontWeight: nombreTecnicoSeleccionado != null
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (tecnicoIdSeleccionado == null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Por favor seleccione un técnico',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: fechaIngresoController,
                        decoration: const InputDecoration(
                          labelText: 'Fecha de Ingreso',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly: true,
                        onTap: () async {
                          final fecha = await showDatePicker(
                            context: dialogContext,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (fecha != null) {
                            setDialogState(() {
                              fechaIngresoSeleccionada = fecha;
                              fechaIngresoController.text = '${fecha.year}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}';
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor seleccione la fecha de ingreso';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: fechaEntregaController,
                        decoration: const InputDecoration(
                          labelText: 'Fecha de Entrega (Opcional)',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.event_available),
                        ),
                        readOnly: true,
                        onTap: () async {
                          final fecha = await showDatePicker(
                            context: dialogContext,
                            initialDate: fechaIngresoSeleccionada ?? DateTime.now(),
                            firstDate: fechaIngresoSeleccionada ?? DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (fecha != null) {
                            setDialogState(() {
                              fechaEntregaSeleccionada = fecha;
                              fechaEntregaController.text = '${fecha.year}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}';
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Estado',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.info),
                        ),
                        value: estadoSeleccionado,
                        items: estados.map((estado) {
                          return DropdownMenuItem<String>(
                            value: estado,
                            child: Text(estado.toUpperCase()),
                          );
                        }).toList(),
                        onChanged: (String? nuevoEstado) {
                          setDialogState(() {
                            estadoSeleccionado = nuevoEstado;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Por favor seleccione un estado';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate() && 
                        tallerIdSeleccionado != null && 
                        telefonoIdSeleccionado != null && 
                        tecnicoIdSeleccionado != null &&
                        estadoSeleccionado != null) {
                      Navigator.of(dialogContext).pop();
                      
                      if (!mounted) return;
                      
                      showDialog(
                        context: scaffoldContext,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(color: Colors.orange),
                        ),
                      );

                      try {
                        // Asegurar que el coste siempre tenga 2 decimales
                        final costeValue = double.parse(costeController.text.trim());
                        // Redondear a 2 decimales
                        final costeFormateado = (costeValue * 100).roundToDouble() / 100;
                        
                        // Calcular duración automáticamente en horas
                        int duracionCalculada = 0;
                        if (fechaIngresoSeleccionada != null) {
                          if (fechaEntregaSeleccionada != null) {
                            // Calcular diferencia entre fecha de entrega y fecha de ingreso en horas
                            final diferencia = fechaEntregaSeleccionada!.difference(fechaIngresoSeleccionada!);
                            duracionCalculada = diferencia.inHours;
                            if (duracionCalculada < 0) {
                              duracionCalculada = 0;
                            }
                          } else {
                            // Si no hay fecha de entrega, calcular desde fecha de ingreso hasta ahora en horas
                            final diferencia = DateTime.now().difference(fechaIngresoSeleccionada!);
                            duracionCalculada = diferencia.inHours;
                            if (duracionCalculada < 0) {
                              duracionCalculada = 0;
                            }
                          }
                        }
                        
                        final exito = await crearReparacion(
                          tituloController.text.trim(),
                          descripcionController.text.trim(),
                          duracionCalculada,
                          costeFormateado,
                          tallerIdSeleccionado!,
                          telefonoIdSeleccionado!,
                          tecnicoIdSeleccionado!,
                          fechaIngresoController.text.trim(),
                          fechaEntregaController.text.trim(),
                          estadoSeleccionado!,
                        );

                        if (!mounted) return;
                        
                        Navigator.of(scaffoldContext).pop();

                        if (exito) {
                          ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                            const SnackBar(
                              content: Text('Reparación creada exitosamente'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                          // Esperar un momento para que la API procese la creación
                          await Future.delayed(const Duration(milliseconds: 800));
                          if (mounted) {
                            setState(() {
                              _reparacionesFuture = fetchReparaciones();
                            });
                          }
                        } else {
                          ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                            const SnackBar(
                              content: Text('Error: No se pudo crear la reparación'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 4),
                            ),
                          );
                        }
                      } catch (e) {
                        if (!mounted) return;
                        
                        Navigator.of(scaffoldContext).pop();
                        ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                          SnackBar(
                            content: Text('Error al crear reparación: ${e.toString()}'),
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 4),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reparaciones"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarDialogoAgregarReparacion,
            tooltip: 'Agregar reparación',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarReparacion,
        child: const Icon(Icons.add),
        tooltip: 'Agregar reparación',
      ),
      body: FutureBuilder<List<Reparacion>>(
        key: ValueKey(_reparacionesFuture),
        future: _reparacionesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.orange));
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      "Error al cargar datos",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _reparacionesFuture = fetchReparaciones();
                        });
                      },
                      child: const Text("Reintentar"),
                    ),
                  ],
                ),
              ),
            );
          }

          final reparaciones = snapshot.data!;

          // Ordenar reparaciones: primero las "pendiente", luego las demás
          final reparacionesOrdenadas = List<Reparacion>.from(reparaciones);
          reparacionesOrdenadas.sort((a, b) {
            // Si ambas son "pendiente" o ninguna es "pendiente", mantener orden original
            if (a.estado == 'pendiente' && b.estado != 'pendiente') {
              return -1; // a va antes que b
            } else if (a.estado != 'pendiente' && b.estado == 'pendiente') {
              return 1; // b va antes que a
            }
            // Si tienen el mismo estado, ordenar por ID descendente (más recientes primero)
            return b.id.compareTo(a.id);
          });

          return FutureBuilder<List<dynamic>>(
            future: Future.wait([
              fetchRelaciones(),
              fetchTecnicos(),
              fetchClientes(),
            ]),
            builder: (context, relacionesSnapshot) {
              if (relacionesSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.orange));
              }

              final relaciones = relacionesSnapshot.data?[0] as List<dynamic>? ?? [];
              final talleres = relaciones.isNotEmpty ? (relaciones[0] as List).cast<Taller>() : <Taller>[];
              final sucursales = relaciones.isNotEmpty ? (relaciones[1] as List).cast<Sucursal>() : <Sucursal>[];
              final telefonos = relaciones.isNotEmpty ? (relaciones[2] as List).cast<Telefono>() : <Telefono>[];
              final tecnicos = (relacionesSnapshot.data?[1] as List?)?.cast<Tecnico>() ?? <Tecnico>[];
              final clientes = (relacionesSnapshot.data?[2] as List?)?.cast<Cliente>() ?? <Cliente>[];

              // Obtener teléfonos con múltiples reparaciones
              final telefonosMultiples = _obtenerTelefonosConMultiplesReparaciones(
                reparaciones,
                telefonos,
              );

              // Filtrar reparaciones por estado
              final pendientes = _filtrarReparacionesPorEstado(reparaciones, 'pendiente');
              final enProgreso = _filtrarReparacionesPorEstado(reparaciones, 'en progreso');
              final completadas = _filtrarReparacionesPorEstado(reparaciones, 'completada');
              final canceladas = _filtrarReparacionesPorEstado(reparaciones, 'cancelada');

              return CustomScrollView(
                slivers: [
                  // Card de teléfonos con múltiples reparaciones al inicio - SIEMPRE visible
                  SliverToBoxAdapter(
                    child: _buildCardTelefonosMultiplesReparaciones(telefonosMultiples),
                  ),
                  // Cards de reparaciones segmentadas por estado
                  if (reparaciones.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: const Center(
                        child: Text("No hay reparaciones disponibles"),
                      ),
                    )
                  else
                    ...[
                      // Card de Pendientes
                      SliverToBoxAdapter(
                        child: _buildCardReparacionesPorEstado(
                          'Pendientes',
                          pendientes,
                          Colors.orange,
                          talleres,
                          sucursales,
                          telefonos,
                          tecnicos,
                          clientes,
                        ),
                      ),
                      // Card de En Progreso
                      SliverToBoxAdapter(
                        child: _buildCardReparacionesPorEstado(
                          'En Progreso',
                          enProgreso,
                          Colors.blue,
                          talleres,
                          sucursales,
                          telefonos,
                          tecnicos,
                          clientes,
                        ),
                      ),
                      // Card de Completadas
                      SliverToBoxAdapter(
                        child: _buildCardReparacionesPorEstado(
                          'Completadas',
                          completadas,
                          Colors.green,
                          talleres,
                          sucursales,
                          telefonos,
                          tecnicos,
                          clientes,
                        ),
                      ),
                      // Card de Canceladas
                      SliverToBoxAdapter(
                        child: _buildCardReparacionesPorEstado(
                          'Canceladas',
                          canceladas,
                          Colors.red,
                          talleres,
                          sucursales,
                          telefonos,
                          tecnicos,
                          clientes,
                        ),
                      ),
                    ],
                ],
              );
            },
          );
        },
      ),
    );
  }
}
