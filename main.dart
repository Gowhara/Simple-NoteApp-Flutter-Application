import 'package:flutter/material.dart';
import 'package:untitled/db/helper.dart';
import 'home1.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


void main() {
  runApp(MyApp());
}

class ColorModel {
  final int id;
  final int color;
  final bool isChecked;

  ColorModel({required this.id, required this.color, required this.isChecked});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'color': color,
      'isChecked': isChecked ? 1 : 0,
    };
  }
}

class DatabaseHelper {
  late Database _database;

  Future<void> initializeDatabase() async {
    final String path = join(await getDatabasesPath(), 'color_picker.db');
    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE colors(
        id INTEGER PRIMARY KEY,
        color INTEGER,
        isChecked INTEGER
      )
    ''');
  }

  Future<void> insertColor(ColorModel color) async {
    await _database.insert('colors', color.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ColorModel>> getColors() async {
    final List<Map<String, dynamic>> maps = await _database.query('colors');
    return List.generate(maps.length, (i) {
      return ColorModel(
        id: maps[i]['id'],
        color: maps[i]['color'],
        isChecked: maps[i]['isChecked'] == 1,
      );
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorPickerScreen(),
    );
  }
}

class ColorPickerScreen extends StatefulWidget {
  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  late List<ColorModel> savedColors;
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    savedColors = [];
    databaseHelper = DatabaseHelper();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    await databaseHelper.initializeDatabase();
    _loadColors();
  }

  Future<void> _loadColors() async {
    final List<ColorModel> colors = await databaseHelper.getColors();
    setState(() {
      savedColors = colors;
    });
  }

  Future<void> _toggleColor(int index) async {
    final List<ColorModel> updatedColors = List.from(savedColors);
    updatedColors[index] = ColorModel(
      id: savedColors[index].id,
      color: savedColors[index].color,
      isChecked: !savedColors[index].isChecked,
    );

    await databaseHelper.insertColor(updatedColors[index]);
    _loadColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: savedColors
            .map(
              (color) => GestureDetector(
            onTap: () => _toggleColor(savedColors.indexOf(color)),
            child: Container(
              width: 50,
              height: 50,
              color: Color(color.color),
              child: color.isChecked
                  ? Icon(
                Icons.check,
                color: Colors.white,
              )
                  : null,
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}*/

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Database _database;
  late int selectedColorIndex;
  List<Color> colors = [Colors.red, Colors.green, Colors.blue];

  @override
  void initState() {
    super.initState();
    _initDatabase();
    selectedColorIndex = -1; // No color selected initially
  }

  void _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'color_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE colors(id INTEGER PRIMARY KEY, color INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> _insertColor(int color) async {
    await _database.insert(
      'colors',
      {'color': color},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void _onContainerTap(int index) {
    setState(() {
      selectedColorIndex = index;
      _insertColor(colors[index].value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Selection'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            colors.length,
                (index) => GestureDetector(
              onTap: () => _onContainerTap(index),
              child: Container(
                width: 80,
                height: 80,
                color: colors[index],
                child: selectedColorIndex == index
                    ? Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/