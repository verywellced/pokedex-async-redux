import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.searchController,
    required this.onClear,
    required this.onChanged,
    super.key,
  });

  final TextEditingController searchController;
  final VoidCallback onClear;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          decoration: const InputDecoration(contentPadding: EdgeInsets.only(left: 40.0)),
          style: Theme.of(context).textTheme.bodySmall,
          controller: searchController,
          onChanged: onChanged,
        ),
        const Positioned(
          bottom: 12.0,
          child: Icon(Icons.search),
        ),
        Positioned(
          right: 10.0,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: onClear,
          ),
        )
      ],
    );
  }
}
