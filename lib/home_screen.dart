import 'package:dock_app/utility/constants.dart';
import 'package:dock_app/dock_icon.dart';
import 'package:flutter/material.dart';

/// A widget that represents the dock with draggable and sortable icons.
class DockApp extends StatefulWidget {
  const DockApp({super.key});

  @override
  DockAppState createState() => DockAppState();
}

class DockAppState extends State<DockApp> {
  /// List of dock items represented by their respective icons.
  List<IconData> dockItems = [
    Icons.person,
    Icons.message,
    Icons.call,
    Icons.camera,
    Icons.photo,
  ];

  /// Method to handle swapping the positions of dock items.
  /// Supports both left-to-right and right-to-left movements.
  void swapItems(int oldIndex, int newIndex) {
    setState(() {
      // If moving right, adjust newIndex
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      // Create a temporary variable to hold the icon being dragged
      final draggedItem = dockItems[oldIndex];
      // Move the item from the old index to the new index
      dockItems[oldIndex] = dockItems[newIndex];
      dockItems[newIndex] = draggedItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dock App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'H E L L O 👋\nWelcome Back!',
              style: titleStyle,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'You Can Drag and Put Icons Anywhere',
                    style: subtitleStyle,
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Container(
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(kDefaultPadding)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(dockItems.length, (index) {
                        return DockIcon(
                          icon: dockItems[index],
                          currentIndex: index,
                          onReorder: swapItems,
                          totalIcons: dockItems.length,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
