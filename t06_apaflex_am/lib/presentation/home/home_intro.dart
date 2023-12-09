import 'package:flutter/material.dart';
import 'package:t06_apaflex_am/List_Tabla/person/mostrar_tabla.dart';
import 'package:t06_apaflex_am/List_Tabla/student/mostrar_tabla.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colegio Alfonso Ugarte N°20191'),
        backgroundColor: const Color.fromARGB(232, 209, 6, 6),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 169, 13, 2), // fondo del menú
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 133, 0, 0), //encabezado
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Colegio Alfonso Ugarte N°20191',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Image.asset(
                      'assets/colegio_logo.png', //logotipo
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              // Opciones del menú
              ListTile(
                leading: const Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                title: const Text(
                  'Dashboard',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navegar a la pantalla de Dashboard
                  Navigator.pop(context); // Cierra el menú
                  // Implementa la navegación a la pantalla de Dashboard aquí
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text(
                  'Apoderado',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navegar a la pantalla de Perfil
                  // Navegar a otra página
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MaestroPerson()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.school,
                  color: Colors.white,
                ),
                title: const Text(
                  'Estudiante',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navegar a la pantalla de Perfil
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MaestroStudent()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text(
                  'Activity',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navegar a la pantalla de Perfil
                  Navigator.pop(context); // Cierra el menú
                  // Implementa la navegación a la pantalla de Perfil aquí
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text(
                  'Worker',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navegar a la pantalla de Perfil
                  Navigator.pop(context); // Cierra el menú
                  // Implementa la navegación a la pantalla de Perfil aquí
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Estadísticas de Pagos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: PieChartWidget(
                      title: 'Personas Pagadas',
                      sections: [
                        
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: PieChartWidget(
                      title: 'Total Recaudado',
                      sections: [
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: PieChartWidget(
                      title: 'Pagos Pendientes',
                      sections: [
                        PieChartSectionData(
                          color: const Color(0xFFE91E63),
                          value: 40,
                          title: '40%',
                        ),
                        PieChartSectionData(
                          color: const Color(0xFFE0E0E0),
                          value: 60,
                          title: '60%',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: PieChartWidget(
                      title: 'Estudiantes Registrados',
                      sections: [
                        PieChartSectionData(
                          color: const Color(0xFF2196F3),
                          value: 80,
                          title: '80%',
                        ),
                        PieChartSectionData(
                          color: const Color(0xFFE0E0E0),
                          value: 20,
                          title: '20%',
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
  }
}

class PieChartWidget extends StatelessWidget {
  final String title;
  final List<PieChartSectionData> sections;

  const PieChartWidget({
    required this.title,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              PieChart(
                PieChartData(
                  sections: sections,
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  startDegreeOffset: -90,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}