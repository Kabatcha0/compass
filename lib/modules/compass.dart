import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercompass/cubit/cubit.dart';
import 'package:fluttercompass/cubit/states.dart';

class CompassScreen extends StatelessWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CompassCubit()..getCompass(),
        child: BlocConsumer<CompassCubit, CompassStates>(
            listener: (context, state) {},
            builder: (context, state) => Scaffold(
                  backgroundColor: Colors.black,
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    centerTitle: true,
                    title: const Text(
                      "Compass",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          CompassCubit.get(context).heading != null
                              ? "${CompassCubit.get(context).heading!.ceil()}\u00B0"
                              : "0",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "image/cadrant.png",
                              fit: BoxFit.cover,
                            ),
                            Transform.rotate(
                              angle: CompassCubit.get(context).heading != null
                                  ? (CompassCubit.get(context).heading!) *
                                      (pi / 180) *
                                      -1
                                  : 0,
                              child: Image.asset(
                                "image/compass.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
