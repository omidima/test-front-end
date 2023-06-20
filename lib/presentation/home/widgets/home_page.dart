import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomePageController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(controller.trivia.value.text)),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => controller.fetchTriviaForNumber(42),
              child: const Text('Fetch Trivia for Number 42'),
            ),
            ElevatedButton(
              onPressed: () => controller.fetchRandomTrivia(),
              child:const  Text('Fetch Random Trivia'),
            ),
          ],
        ),
      ),
    );
  }
}
