import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importa google_fonts

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App UI',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // Usando Google Fonts para el texto global de la app
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // La aplicación ahora comienza con la OnboardingScreen
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Nueva pantalla de bienvenida (OnboardingScreen)
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco como en la imagen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de nubes y texto "CHAT APP"
            Stack(
              alignment: Alignment.center,
              children: [
                // Círculos concéntricos de fondo
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.purple.withOpacity(0.1), width: 2),
                  ),
                ),
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.purple.withOpacity(0.2), width: 2),
                  ),
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.purple.withOpacity(0.3), width: 2),
                  ),
                ),
                // Icono de nubes (simulado con Iconos)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud, // Un icono de nube simple
                      color: Colors.purple[700],
                      size: 80,
                    ),
                    Text(
                      'CHAT APP',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 80), // Espacio entre el logo y el texto
            // Texto descriptivo
            Text(
              'A new way to connect\nwith your friends',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 80), // Espacio antes del botón
            // Botón "Get Started"
            GestureDetector(
              onTap: () {
                // Navegar a la pantalla de chat
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatHomePage()),
                );
              },
              child: Container(
                width: 250, // Ancho fijo para el botón
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                  color: const Color(0xFF8A2BE2), // Color púrpura del botón
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // Cambios en x, y
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Get Started',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// La pantalla de chat existente (con la corrección de initState)
class ChatHomePage extends StatefulWidget {
  const ChatHomePage({super.key});

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  // Corrección: Declarar como 'late' e inicializar en initState
  late int _selectedSegment; 

  @override
  void initState() {
    super.initState();
    _selectedSegment = 0; // Inicialización segura en initState
  }

  final List<Map<String, String>> chatItems = const [
    {
      'name': 'Kivomi Takada',
      'message': 'The only true fear is the fear of...',
      'avatar': 'https://placehold.co/100x100/94618E/FFFFFF?text=KT',
      'unread': 'true',
    },
    {
      'name': 'Itachi Uchiha',
      'message': "People's lives don't end when t...",
      'avatar': 'https://placehold.co/100x100/3E2F5B/FFFFFF?text=IU',
      'unread': 'true',
    },
    {
      'name': 'Eren',
      'message': 'Tatakai 💪',
      'avatar': 'https://placehold.co/100x100/6A057F/FFFFFF?text=E',
      'unread': 'false',
    },
    {
      'name': 'Sukuna Ryomen',
      'message': '😈😈😈',
      'avatar': 'https://placehold.co/100x100/802046/FFFFFF?text=SR',
      'unread': 'false',
    },
    {
      'name': 'Soma poti',
      'message': 'The only true fear is the fear of...',
      'avatar': 'https://placehold.co/100x100/523A73/FFFFFF?text=SP',
      'unread': 'false',
    },
    {
      'name': 'Eilly Pope',
      'message': 'You okay there?',
      'avatar': 'https://placehold.co/100x100/663F46/FFFFFF?text=EP',
      'unread': 'false',
    },
    {
      'name': 'John Doe',
      'message': 'What are you up to?',
      'avatar': 'https://placehold.co/100x100/4D4D4D/FFFFFF?text=JD',
      'unread': 'false',
    },
    {
      'name': 'Jane Smith',
      'message': 'See you tomorrow!',
      'avatar': 'https://placehold.co/100x100/778899/FFFFFF?text=JS',
      'unread': 'false',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Aumenta la altura del AppBar
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Chat',
            style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage('https://placehold.co/100x100/E0BBE4/FFFFFF?text=You'), // Tu foto de perfil
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSegment = 0;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: _selectedSegment == 0
                              ? const Color(0xFF8A2BE2) // Purple
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Personal',
                          style: GoogleFonts.inter(
                            color: _selectedSegment == 0
                                ? Colors.white
                                : Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSegment = 1;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: _selectedSegment == 1
                              ? const Color(0xFF8A2BE2) // Purple
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Groups',
                          style: GoogleFonts.inter(
                            color: _selectedSegment == 1
                                ? Colors.white
                                : Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8.0),
              itemCount: chatItems.length,
              itemBuilder: (context, index) {
                final chat = chatItems[index];
                return ChatListItem(
                  name: chat['name']!,
                  message: chat['message']!,
                  avatarUrl: chat['avatar']!,
                  hasUnread: chat['unread'] == 'true',
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción del botón flotante
        },
        backgroundColor: const Color(0xFF8A2BE2), // El color púrpura del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Hace el botón circular
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String avatarUrl;
  final bool hasUnread;

  const ChatListItem({
    super.key,
    required this.name,
    required this.message,
    required this.avatarUrl,
    this.hasUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Acción al tocar el elemento del chat
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(avatarUrl),
              onBackgroundImageError: (exception, stackTrace) {
                // Puedes mostrar un icono de error o un color de fondo si la imagen no carga
                debugPrint('Error loading image: $exception');
              },
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (hasUnread)
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
