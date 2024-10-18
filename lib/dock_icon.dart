import 'package:dock_app/utility/constants.dart';
import 'package:flutter/material.dart';

/// A widget that represents a draggable dock icon with animation.
class DockIcon extends StatefulWidget {
  final IconData icon;
  final Function(int oldIndex, int newIndex) onReorder;
  final int currentIndex;
  final int totalIcons;

  const DockIcon({
    super.key,
    required this.icon,
    required this.onReorder,
    required this.currentIndex,
    required this.totalIcons,
  });

  @override
  DockIconState createState() => DockIconState();
}

class DockIconState extends State<DockIcon> {
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      // The data being dragged is the current index of this icon
      data: widget.currentIndex,
      // Widget to show while dragging
      feedback: Material(
        color: Colors.transparent,
        child: Container(
            margin: const EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2, horizontal: kDefaultPadding / 4),
            decoration: BoxDecoration(
              color: Colors
                  .primaries[widget.icon.hashCode % Colors.primaries.length],
              borderRadius: BorderRadius.circular(kDefaultPadding / 1),
            ),
            child: Icon(widget.icon, size: kDefaultPadding * 3.75)),
      ),
      // Widget to show in place of the dragged icon
      childWhenDragging: Opacity(
        opacity: 0.5,
        child:
            Icon(widget.icon, color: kGreyColor, size: kDefaultPadding * 3.13),
      ),
      // Called when drag starts
      onDragStarted: () {
        setState(() {
          isDragging = true;
        });
      },
      // Called when drag ends
      onDragEnd: (details) {
        setState(() {
          isDragging = false;
        });
      },
      // Called when drag completes successfully
      onDragCompleted: () {
        setState(() {
          isDragging = false;
        });
      },
      child: DragTarget<int>(
        // Determine if the dragged item can be accepted
        onWillAcceptWithDetails: (details) {
          return details.data != widget.currentIndex;
        },
        // Handle the acceptance of a dragged item
        onAcceptWithDetails: (details) {
          widget.onReorder(details.data, widget.currentIndex);
        },
        builder: (context, candidateData, rejectedData) {
          return Container(
            constraints: const BoxConstraints(minWidth: kDefaultPadding * 3.2),
            height: kDefaultPadding * 3,
            margin: const EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2, horizontal: kDefaultPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultPadding / 2),
              color: Colors
                  .primaries[widget.icon.hashCode % Colors.primaries.length],
            ),
            child: Center(child: Icon(widget.icon, color: kWhiteColor)),
          );
        },
      ),
    );
  }
}
