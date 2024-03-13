import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:test_app/repository/api_request_service.dart';
import 'package:test_app/home/my_grid_view.dart';
import 'package:test_app/home/my_list_view.dart';
import 'package:test_app/repository/repository.dart';
import 'feature/detail/Bloc_request/my_bloc.dart';
import 'home/my_button.dart';
import 'home/filters/bottom_sheet.dart';

void main() {
  MediaKit.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(create: (_) => Dio()),
        RepositoryProvider(
          create: (context) => RequestService(context.read()),
        ),
        RepositoryProvider(
          create: (context) => Repository(context.read()),
        ),
        BlocProvider(
          create: (context) =>
              MyBloc(context.read<Repository>())..add(UserRequest()),
        ),
      ],
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
      backgroundColor: const Color.fromRGBO(34, 35, 41, 1),
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
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<MyBloc, UserState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (final type in MyContentType.values)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: MyButton(
                            name: type.value,
                            onTap: () {
                              context
                                  .read<MyBloc>()
                                  .add(SelectContentType(type));
                              context.read<MyBloc>().add(UserRequest());
                            },
                            isActive: state.currentContentType == type,
                          ),
                        ),
                      const SizedBox(
                        width: 100,
                        height: 50,
                        child: MyBottomSheet(),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MyBloc, UserState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (!state.isLoading) {
                  //return MyListView(data: state.data);
                  return MyGridView(data: state.data);
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
