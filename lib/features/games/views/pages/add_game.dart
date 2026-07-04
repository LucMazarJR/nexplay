import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nexplay/features/games/models/enum/add_game_form.dart';
import 'package:nexplay/features/games/models/class/game_tags.dart';
import 'package:nexplay/features/games/views/widgets/tags_dialog.dart';
import 'package:nexplay/features/games/views/widgets/upload_photo.dart';

class AddGame extends StatefulWidget {
  const AddGame({super.key});

  @override
  State<AddGame> createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  final _formKey = GlobalKey<FormState>();
  int? _value;
  int selected = 0;
  List<GameTag> allTags = mockGameTags; // Buscar tags no banco
  Set<GameTag>? selectedTags;
  GameStatus gameStatusView = GameStatus.novo;

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
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processando dados')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 4,
                shape: StadiumBorder(),
                backgroundColor: themeColors.primary,
                foregroundColor: themeColors.onPrimary,
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save_outlined, size: 30),
                  Text('Salvar jogo'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 15,
              children: [
                UploadPhoto(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text("Digite aqui o nome do jogo"),
                    labelText: "Nome",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                ),
                Column(
                  children: [
                    DropdownButtonFormField(
                      hint: Text('Selecione'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Categorias'),
                      ),
                      items: [
                        DropdownMenuItem(value: 1, child: Text('PC')),
                        DropdownMenuItem(value: 2, child: Text('Playstation')),
                      ],
                      initialValue: _value,
                      onChanged: (value) {
                        if (value is int) {
                          setState(() {
                            _value = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormField<GameStatus>(
                        initialValue: gameStatusView,
                        validator: (value) {
                          if (value == null) {
                            return 'Selecione o status do jogo';
                          }
                          return null;
                        },
                        builder: (field) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              label: Text(
                                "Status do jogo",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                              errorText: field.errorText,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: SegmentedButton<GameStatus>(
                                style: SegmentedButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                segments: const [
                                  ButtonSegment(
                                    value: GameStatus.novo,
                                    label: Text('Novo'),
                                  ),
                                  ButtonSegment(
                                    value: GameStatus.continuar,
                                    label: Text('Continuar'),
                                  ),
                                  ButtonSegment(
                                    value: GameStatus.finalizado,
                                    label: Text('Finalizado'),
                                  ),
                                ],
                                selected: {gameStatusView},
                                onSelectionChanged: (newSelection) {
                                  final newValue = newSelection.first;

                                  setState(() {
                                    gameStatusView = newValue;
                                  });

                                  field.didChange(newValue);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                if (gameStatusView == .continuar)
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("O que falta?"),
                      hint: Text("Digite aqui o falta ser feito no jogo"),
                      border: OutlineInputBorder(),
                    ),
                    minLines: 1,
                    maxLines: 5,
                  )
                else if (gameStatusView == .finalizado)
                  FormField(
                    builder: (field) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          errorText: field.errorText,
                          label: Text(
                            "Nota para o jogo",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: RatingBar(
                            updateOnDrag: true,
                            initialRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ratingWidget: RatingWidget(
                              full: Icon(Icons.star, color: Colors.amber),
                              half: Icon(
                                Icons.star_half_outlined,
                                color: Colors.amber,
                              ),
                              empty: Icon(
                                Icons.star_outline,
                                color: Colors.amber,
                              ),
                            ),
                            onRatingUpdate: (rating) {
                              // Tratamento futuro do formulário
                            },
                            glow: false,
                          ),
                        ),
                      );
                    },
                  ),
                ElevatedButton(
                  onPressed: () async {
                    Set<GameTag>? retrievedTags =
                        await showDialog<Set<GameTag>>(
                          context: context,
                          builder: (BuildContext context) {
                            return TagsDialog(tags: allTags);
                          },
                        );
                    setState(() {
                      selectedTags = retrievedTags;
                    });
                  },
                  child: Text("Mostrar tags"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
