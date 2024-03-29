import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  // final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFavorite;
  bool showFavoriteIconBtn;
  CustomAppBar({
    super.key,
    required this.titleappbar,
    // required this.onPressedIcon,
    required this.onPressedSearch,
    required this.onPressedIconFavorite,
    required this.showFavoriteIconBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: const Icon(Icons.search),
                ),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // const SizedBox(width: 10),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.grey[200],
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   width: 60,
          //   padding: const EdgeInsets.symmetric(vertical: 8),
          //   child: IconButton(
          //     onPressed: onPressedIcon,
          //     icon: Icon(
          //       Icons.notifications_active_outlined,
          //       size: 30,
          //       color: Colors.grey[600],
          //     ),
          //   ),
          // ),
          const SizedBox(width: 10),
          showFavoriteIconBtn
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 60,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: IconButton(
                    onPressed: onPressedIconFavorite,
                    icon: Icon(
                      Icons.favorite_outline,
                      size: 30,
                      color: Colors.grey[600],
                    ),
                  ),
                )
              : const Center(),
        ],
      ),
    );
  }
}
