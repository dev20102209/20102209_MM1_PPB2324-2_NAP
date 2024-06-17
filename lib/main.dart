import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> contactsList = [
    {'title': 'Contacts1', 'subtitle': 'Contacts'},
    {'title': 'Contacts2', 'subtitle': 'Contacts'},
    {'title': 'Contacts3', 'subtitle': 'Contacts'},
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Icon(Icons.phone_android),
              const SizedBox(height: 10),
              const Text(
                "Create New Contacts",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                "Silahkan isi informasi kontak yang ingin anda simpan, masukan informasi yang valid agar dapat dihubungi",
                textAlign: TextAlign.center,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(231, 224, 236, 1),
                    border: BorderDirectional(bottom: BorderSide()),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        hintText: 'Insert Your Name',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon masukkan nama Anda';
                        }
                        if (!RegExp(r'^[A-Z][a-z]*(\s[A-Z][a-z]*)+$')
                            .hasMatch(value)) {
                          return 'Format nama salah';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(231, 224, 236, 1),
                    border: BorderDirectional(bottom: BorderSide()),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      controller: _numberController,
                      decoration: const InputDecoration(
                        labelText: "Nomor",
                        hintText: '+62...',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon masukkan nomor Anda';
                        }
                        if (!RegExp(r'^0[0-9]{8,14}$').hasMatch(value)) {
                          return 'Format nomor salah';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (selectedIndex != null) {
                    // Show edit dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Edit Contact"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  labelText: "Name",
                                  hintText: 'Insert Your Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Mohon masukkan nama Anda';
                                  }
                                  if (!RegExp(r'^[A-Z][a-z]*(\s[A-Z][a-z]*)+$')
                                      .hasMatch(value)) {
                                    return 'Format nama salah';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: _numberController,
                                decoration: const InputDecoration(
                                  labelText: "Nomor",
                                  hintText: '+62...',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Mohon masukkan nomor Anda';
                                  }
                                  if (!RegExp(r'^0[0-9]{8,14}$')
                                      .hasMatch(value)) {
                                    return 'Format nomor salah';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (nameValidation() && numberValidation()) {
                                  updateContact(selectedIndex!);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text("Save"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    if (nameValidation() && numberValidation()) {
                      addContact();
                    }
                  }
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 20),
              const Text(
                "List Contacts",
                style: TextStyle(fontSize: 20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contactsList
                    .asMap()
                    .entries
                    .map(
                      (entry) => ListTile(
                        leading: CircleAvatar(
                          child: Text(entry.value['title']![0]),
                        ),
                        title: Text(entry.value['title']!),
                        subtitle: Text(entry.value['subtitle']!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {
                                  selectedIndex = entry.key;
                                  _nameController.text =
                                      entry.value['title'] ?? '';
                                  _numberController.text =
                                      entry.value['subtitle'] ?? '';
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                deleteContact(entry.key);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool nameValidation() {
    String name = _nameController.text;

    // Cek apakah nama diisi oleh user
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama harus diisi!')),
      );
      return false;
    }

    // Cek apakah nama terdiri dari minimal 2 kata
    List<String> nameParts = name.split(' ');
    if (nameParts.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Nama harus terdiri dari minimal 2 kata!')),
      );
      return false;
    }

    // Cek setiap kata harus dimulai dengan huruf kapital
    for (String part in nameParts) {
      if (part.substring(0, 1).toUpperCase() != part.substring(0, 1)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Setiap kata dalam nama harus dimulai dengan huruf kapital!')),
        );
        return false;
      }
    }

    // Cek apakah nama mengandung angka atau karakter khusus
    RegExp specialChars = RegExp(r'[!@#\$%^&*(),.?":{}|<>0-9]');
    if (specialChars.hasMatch(name)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Nama tidak boleh mengandung angka atau karakter khusus!')),
      );
      return false;
    }

    // Jika semua kriteria terpenuhi, maka nama valid
    return true;
  }

  bool numberValidation() {
    String number = _numberController.text;

    // Cek apakah nomor telepon diisi oleh user
    if (number.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nomor telepon harus diisi!')),
      );
      return false;
    }

    // Cek apakah nomor telepon terdiri dari angka saja
    if (!RegExp(r'^[0-9]+$').hasMatch(number)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Nomor telepon harus terdiri dari angka saja!')),
      );
      return false;
    }

    // Cek panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit
    if (number.length < 8 || number.length > 15) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit!')),
      );
      return false;
    }

    // Cek nomor telepon harus dimulai dengan angka 0
    if (number.substring(0, 1) != '0') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Nomor telepon harus dimulai dengan angka 0!')),
      );
      return false;
    }

    // Jika semua kriteria terpenuhi, maka nomor telepon valid
    return true;
  }

  void addContact() {
    String name = _nameController.text;
    String number = _numberController.text;
    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contactsList.add({'title': name, 'subtitle': number});
        _nameController.clear();
        _numberController.clear();
      });
    }
  }

  void updateContact(int index) {
    String name = _nameController.text;
    String number = _numberController.text;
    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contactsList[index] = {'title': name, 'subtitle': number};
        _nameController.clear();
        _numberController.clear();
        selectedIndex = null; // Reset selected index after updating
      });
    }
  }

  void deleteContact(int index) {
    setState(() {
      contactsList.removeAt(index);
      if (selectedIndex == index) {
        // Reset selected index if the deleted item was selected
        selectedIndex = null;
        _nameController.clear();
        _numberController.clear();
      } else if (selectedIndex != null && selectedIndex! > index) {
        // Adjust selected index if necessary
        selectedIndex = selectedIndex! - 1;
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }
}
