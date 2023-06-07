import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/data/models/contact_info_model.dart';
import 'package:nostra_casa/utility/enums.dart';
import '../business_logic/get_bloc/get_bloc.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetBloc()..add(GetRequestApiEvent(getRequestType: GetRequestType.contactInfo)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<GetBloc, GetState>(
                builder: (context, state) {
                  if(state is GetDone){
                    final model = state.getRequestModel;
                    if(model is WelcomeAbout){
                      return Text(
                        model.results[0].phoneNumber
                      );
                    }
                  }
                  return Text(
                    'loading',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
                  );
                },
              ),
              const Text(
                'You have pushed the button this many times:',

              ),
              Text(
                '$_counter',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
