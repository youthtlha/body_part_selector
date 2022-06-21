import 'package:body_part_selector/src/body_part_selector.dart';
import 'package:body_part_selector/src/model/body_parts.dart';
import 'package:body_part_selector/src/model/body_side.dart';
import 'package:flutter/material.dart';
import 'package:rotation_stage/rotation_stage.dart';

class BodyPartSelectorTurnable extends StatelessWidget {
  const BodyPartSelectorTurnable({
    super.key,
    required this.bodyParts,
    this.onSelectionUpdated,
    this.mirrored = false,
    this.padding = EdgeInsets.zero,
  });

  final BodyParts bodyParts;
  final Function(BodyParts)? onSelectionUpdated;
  final bool mirrored;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return RotationStage(
      contentBuilder: (index, side, page) => Padding(
        padding: padding,
        child: BodyPartSelector(
          side: side.map(
            front: BodySide.front,
            left: BodySide.left,
            back: BodySide.back,
            right: BodySide.right,
          ),
          bodyParts: bodyParts,
          onSelectionUpdated: onSelectionUpdated,
          mirrored: mirrored,
        ),
      ),
    );
  }
}