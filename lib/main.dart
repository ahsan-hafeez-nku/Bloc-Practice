// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_tut/bloc/counter_bloc.dart';
// import 'package:flutter_bloc_tut/cubit/counter_cubit.dart';
// import 'package:flutter_bloc_tut/home_screen.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => CounterCubit()),
//         BlocProvider(create: (context) => CounterBloc()),
//       ],

//       child: const MaterialApp(home: HomeScreen()),
//     );
//   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_tut/features/todo_state_management/add_todo_page.dart';
// import 'package:flutter_bloc_tut/features/todo_state_management/bloc/todo_bloc.dart';
// // import 'package:flutter_bloc_tut/features/todo_state_management/cubit/todo_cubit.dart';
// import 'package:flutter_bloc_tut/features/todo_state_management/to_do_list.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TodoBloc(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         initialRoute: '/',
//         routes: {
//           '/': (_) => const TodoList(),
//           '/add-todo': (_) => const AddTodoPage(),
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_tut/features/auth/bloc/auth_bloc.dart';
// import 'package:flutter_bloc_tut/features/auth/login_screen.dart';
// import 'package:flutter_bloc_tut/features/auth/pallete.dart';
// import 'package:flutter_bloc_tut/app_bloc_observer.dart';

// void main() {
//   Bloc.observer = AppBlocObserver();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthBloc(),
//       child: MaterialApp(
//         title: 'Bloc Auth',
//         theme: ThemeData.dark().copyWith(
//           scaffoldBackgroundColor: Pallete.backgroundColor,
//         ),
//         home: const LoginScreen(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/app_bloc_observer.dart';
import 'package:flutter_bloc_tut/features/weather/bloc/weather_bloc.dart';
import 'package:flutter_bloc_tut/features/weather/data/data_provider/weather_data_provider.dart';
import 'package:flutter_bloc_tut/features/weather/data/repository/weather_repository.dart';
import 'package:flutter_bloc_tut/features/weather/presentation/screen/weather_screen.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(WeatherDataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
