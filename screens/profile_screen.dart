import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/profile_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/animated_counter.dart';
import 'products_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testUser = User(name: 'Максим', email: 'maks@gmail.com');

    return Scaffold(
      appBar: AppBar(title: const Text('Демонстрація віджетів')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileWidget(
              user: testUser,
              isCompact: false,
            ),
            const SizedBox(height: 32),
            
            CustomButton(
              text: 'Зберегти зміни',
              style: CustomButtonStyle.primary,
              icon: const Icon(Icons.save, color: Colors.white, size: 20),
              onPressed: () {
                print('Зміни збережено');
              },
            ),
            const SizedBox(height: 16),
            
            CustomButton(
              text: 'Видалити профіль',
              style: CustomButtonStyle.danger,
              onPressed: () {
                print('Видалено профіль');
              },
            ),
            const SizedBox(height: 16),
            
            CustomButton(
              text: 'Скасувати',
              style: CustomButtonStyle.outline,
              onPressed: () {
                print('Скасовано');
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsScreen()),
                );
              },
              icon: const Icon(Icons.shopping_bag),
              label: const Text('Перейти до товарів'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              ),
            ),

            const SizedBox(height: 32),
            const AnimatedCounter(maxValue: 5),
          ],
        ),
      ),
    );
  }
}
