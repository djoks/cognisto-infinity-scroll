import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AppSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final Text title;
  final ValueChanged<String> onChange;

  const AppSearchBar({super.key, required this.title, required this.onChange});

  @override
  State<AppSearchBar> createState() => _MyWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyWidgetState extends State<AppSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final BehaviorSubject<String> _searchSubject = BehaviorSubject();
  bool _isSearching = false;

  Widget _buildSearchField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(hintText: "Type here to search..."),
      onChanged: (value) {},
    );
  }

  @override
  void initState() {
    super.initState();
    _searchSubject.distinct().debounceTime(Duration(milliseconds: 300)).listen((
      value,
    ) {
      widget.onChange(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _isSearching ? _buildSearchField() : widget.title,
      actions: [
        if (_isSearching)
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = false;
              });
            },
            icon: Icon(Icons.close),
          )
        else
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
            icon: Icon(Icons.search),
          ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.clear();
    _controller.dispose();
    _searchSubject.close();
    FocusScope.of(context).unfocus();
  }

  void _startSearch() {}

  void _stopSearch() {}
}
