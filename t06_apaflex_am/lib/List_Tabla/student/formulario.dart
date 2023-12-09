import 'package:flutter/material.dart';
import 'package:t06_apaflex_am/List_Tabla/student/mostrar_tabla.dart';
import 'package:t06_apaflex_am/model/student.dart';
import 'package:t06_apaflex_am/services/StudentApi.dart';

class FormularioStudent extends StatefulWidget {
  const FormularioStudent({Key? key}) : super(key: key);

  @override
  _FormularioStudentState createState() => _FormularioStudentState();
}

class _FormularioStudentState extends State<FormularioStudent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController person_idController = TextEditingController();
  final TextEditingController namesController = TextEditingController();
  final TextEditingController last_nameController = TextEditingController();
  final TextEditingController document_type_idController =
      TextEditingController();
  final TextEditingController number_documentController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cell_phoneController = TextEditingController();
  final TextEditingController academic_degree_idController =
      TextEditingController();

//DATOS QUE ENVIA AL SERVICE PARA ENVIARLOS AL API
  Future<void> addStudent() async {
    // Recopila los datos del formulario
    final int personId = int.tryParse(person_idController.text) ?? 0;
    final int documentTypeId =
        int.tryParse(document_type_idController.text) ?? 0;
    final int academicDegreeId =
        int.tryParse(academic_degree_idController.text) ?? 0;

    final Student student = Student(
      id: 0,
      person_id: personId,
      names: namesController.text,
      last_name: last_nameController.text,
      document_type_id: documentTypeId,
      number_document: number_documentController.text,
      email: emailController.text,
      cell_phone: cell_phoneController.text,
      academic_degree_id: academicDegreeId,
      states: "A",
    );

    try {
      // ignore: unused_local_variable
      final addedStudent = await api.saveStudent(student.toJson());

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Estudiante agregado con éxito.'),
        ),
      );

      // Después de mostrar el SnackBar, navegar a la página MaestroStudent
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MaestroStudent(),
          ),
        );
      });
    } catch (error) {
      // Imprime el error en la consola de depuración
      print('ERROR AL AGREGAR $error');
      // Aquí puedes manejar los errores, como mostrar un mensaje de error.
      // Por ejemplo:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ERROR, revise los datos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Estudiante Nuevo'),
          titleTextStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.039,
          ),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0), // Esto ocupa todo el ancho
            child: Container(
              color: Color.fromARGB(
                  255, 5, 149, 60), // Color de fondo personalizado
              height: 1, // Altura de la barra inferior
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: person_idController,
                    decoration: const InputDecoration(labelText: 'Apoderado'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por Favor ingresa un id';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: namesController,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por Favor ingrese un nombre';
                      }
                      return null;
                    },
                  ),
                  //Espacio entre FORM Y BTN GUARDAR
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  TextFormField(
                    controller: last_nameController,
                    decoration: const InputDecoration(labelText: 'Apellido'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por Favor ingrese un apellido';
                      }
                      return null;
                    },
                  ),

                  //Espacio entre FORM Y BTN GUARDAR
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Correo'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),

                  //Espacio entre FORM Y BTN GUARDAR
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  TextFormField(
                    controller: document_type_idController,
                    decoration:
                        const InputDecoration(labelText: 'Tipo de Documento'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por Favor ingrese un tipo documento';
                      }
                      return null;
                    },
                  ),

                  //Espacio entre FORM Y BTN GUARDAR
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  TextFormField(
                    controller: number_documentController,
                    decoration:
                        const InputDecoration(labelText: 'Numero de Documento'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por Favor ingresa tu Numero de Documento';
                      }
                      return null;
                    },
                  ),

                  //Espacio entre FORM Y BTN GUARDAR
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  TextFormField(
                    controller: cell_phoneController,
                    decoration:
                        const InputDecoration(labelText: 'Número de Celular'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por Favor ingresa tu celular';
                      }
                      return null;
                    },
                  ),

                  //Espacio entre FORM Y BTN GUARDAR
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  TextFormField(
                    controller: academic_degree_idController,
                    decoration:
                        const InputDecoration(labelText: 'Nivel Academico'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por Favor ingrese un nivel academico';
                      }
                      return null;
                    },
                  ),

                  //Espacio entre FORM Y BTN GUARDAR
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  Container(
                    width: 150,
                    height: 39,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(36, 117, 44, 1),
                    ),
                    child: TextButton(
                      onPressed: () {
                        addStudent(); // Llama a la función que agrega el estudiante
                      },
                      child: const Text(
                        'Agregar Student',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
