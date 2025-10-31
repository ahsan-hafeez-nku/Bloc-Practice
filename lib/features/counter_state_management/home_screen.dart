import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/features/counter_state_management/bloc/counter_bloc.dart';
// import 'package:flutter_bloc_tut/cubit/counter_cubit.dart';
import 'package:flutter_bloc_tut/features/counter_state_management/inc_dec_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    // final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          // bloc: counterCubit,
          builder: (context, counter) {
            return Text('Counter Value: $counter');
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(16),
          backgroundColor: Colors.amber,
        ),

        onPressed: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const IncDecPage())),

        child: Icon(Icons.arrow_right),
      ),
    );
  }
}
