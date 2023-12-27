import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  bool _isLoading = true;
  List<String> _imageItems = [];

  @override
  void initState() {
    _loadImage();

    super.initState();
  }

  Future<void> _loadImage() async {
    await Future.delayed(Duration(seconds: 1));

    _imageItems.clear();
    for(int i=0; i<30; i++){
      _imageItems.add('Dummy Data $i');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: _searchTextController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFF4FB6B2),
                    ),
                    onPressed: () {
                      print('Search Image');
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        itemCount: _imageItems.length,
                        itemBuilder: (context, index) {
                          final imageItem = _imageItems[index];
                          return Text(imageItem);
                        },
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
