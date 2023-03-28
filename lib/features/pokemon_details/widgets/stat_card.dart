import 'package:dartx/dartx.dart';
import 'package:pokedex_start/api/model/stats.dart';
import 'package:pokedex_start/widget/app_text.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.stats,
  });

  final Stats stats;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            BodySmallText(text: stats.stat.name.capitalize()),
            BodySmallText(text: stats.baseStats.toString()),
          ],
        ),
      ),
    );
  }
}
