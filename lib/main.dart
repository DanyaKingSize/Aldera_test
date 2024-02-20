import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/my_list_view.dart';
import 'my_bloc.dart';
import 'my_button.dart';

const textFont = 20;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyBloc()..add(UserRequest()),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        flexibleSpace: Image.asset(
          'assets/appBar.png',
          fit: BoxFit.cover,
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'our intergalactic multimedia collections',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              style: const TextStyle(color: Colors.white, fontSize: 17),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  icon: const Icon(Icons.search),
                  iconColor: Colors.yellow,
                  hintText: 'Search for...',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  fillColor: Colors.white12,
                  filled: true),
              onSubmitted: (text) {
                context.read<MyBloc>().add(UserRequest(text));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    name: 'audio',
                    onTap: () => print( 'afdsfsdfdsudio'),
                  ),
                  const SizedBox(width: 5),
                  MyButton(
                    name: 'Image',
                    onTap: () => print('Tap image'),
                  ),
                  const SizedBox(width: 5),
                  MyButton(
                    name: 'Video',
                    onTap: () => print('Tap Video'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MyBloc, UserState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is Success) {
                  return MyListView(data: state.data);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
