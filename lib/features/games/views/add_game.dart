import 'package:flutter/material.dart';

class AddGame extends StatefulWidget {
  const AddGame({super.key});

  @override
  State<AddGame> createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(size: 35),
        title: Text("Adicionar jogo"),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 28, 16),
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                // Logica para salvar
              },
              style: ElevatedButton.styleFrom(
                elevation: 4,
                shape: StadiumBorder(),
                backgroundColor: themeColors.primary,
                foregroundColor: themeColors.onPrimary,
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
              ),
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.save_outlined, size: 30,), Text('Salvar jogo')],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
        child: Column(children: []),
      ),
    );
  }
}
