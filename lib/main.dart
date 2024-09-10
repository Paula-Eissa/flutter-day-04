import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dice_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => DiceCubit(),
        child: DiceScreen(),
      ),
    );
  }
}

class DiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dice Roller')),
      body: Container(
        color: Colors.green, // Use green color for garden-like background
        child: Center(
          child: BlocBuilder<DiceCubit, DiceState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sum is ${state.sum}',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/d${state.dice1}.svg',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(width: 20),
                      SvgPicture.asset(
                        'assets/d${state.dice2}.svg',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      context.read<DiceCubit>().rollDice();
                    },
                    child: Text('Roll'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
