import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:nexplay/features/games/models/class/game_tags.dart';

class TagsDialog extends StatefulWidget {
  final List<GameTag> tags;
  final Set<GameTag>? userTags;

  const TagsDialog({super.key, required this.tags, this.userTags});

  @override
  State<TagsDialog> createState() => _TagsDialogState();
}

class _TagsDialogState extends State<TagsDialog> {
  Set<GameTag> selectedTags = {};

  @override
  void initState() {
    super.initState();
    selectedTags = widget.userTags ?? {};
  }

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    final allTags = groupBy(widget.tags, (tag) => tag.tipo);

    return AlertDialog(
      backgroundColor: themeColors.surfaceContainer,
      scrollable: true,

      title: Text('Selecione as tags: '),
      titleTextStyle: TextStyle(
        color: themeColors.onSurface,
        fontWeight: .bold,
        fontSize: 20,
      ),
      content: Column(
        spacing: 18,
        children: allTags.entries.map((entry) {
          return Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                entry.key,
                style: TextStyle(
                  fontWeight: .w600,
                  fontSize: 18,
                  color: themeColors.secondary,
                ),
                textAlign: .start,
              ),
              Row(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 5,
                      children: entry.value.map((GameTag tag) {
                        return FilterChip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(18),
                          ),
                          label: Text(tag.nome),
                          selected: selectedTags.contains(tag),
                          onSelected: (bool isSelected) {
                            setState(() {
                              isSelected
                                  ? selectedTags.add(tag)
                                  : selectedTags.remove(tag);
                            });
                          },
                          checkmarkColor: themeColors.onSurface,
                          labelStyle: TextStyle(color: themeColors.onSurface),
                          backgroundColor: themeColors.surfaceContainerHigh,
                          selectedColor: themeColors.secondaryFixedDim,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          );
        }).toList(),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(selectedTags);
          },
          child: Text('Finalizar'),
        ),
      ],
    );
  }
}
