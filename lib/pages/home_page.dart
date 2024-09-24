import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/providers/harrypotter.provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsyncValue = ref.watch(dataProvider);
    return dataAsyncValue.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Fetched Data'),
            actions: [
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              final fullName = item['fullName'] ?? 'Unknown Name';
              final hogwartsHouse = item['hogwartsHouse'] ?? 'Unknown House';
              return ListTile(
                title: Text(fullName),
                subtitle: Text(hogwartsHouse),
              );
            },
          ),
        );
      },
      loading: () => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
