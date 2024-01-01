import 'package:flutter/material.dart';
import 'package:flutter_http/constants/color.dart';
import 'package:flutter_http/pages/delete_page.dart';
import 'package:flutter_http/pages/get_page.dart';
import 'package:flutter_http/pages/post_page.dart';
import 'package:flutter_http/pages/put_page.dart';
import 'package:flutter_http/widgets/item_gridview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('HTTP REQUEST'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            children: [
              ItemGridView(
                label: 'HTTP GET',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetPage())),
              ),
              ItemGridView(
                label: 'HTTP POST',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostPage())),
              ),
              ItemGridView(
                label: 'HTTP PUT',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PutPage())),
              ),
              ItemGridView(
                label: 'HTTP DELETE',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeletePage())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
