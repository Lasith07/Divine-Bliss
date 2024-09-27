import 'package:flutter/material.dart';
import 'login.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: 70,
            backgroundImage: const AssetImage('assets/pic6.jpg'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Sky',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),

          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Account'),
            onTap: () {

            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Billing Information'),
            onTap: () {

            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Location'),
            onTap: () {

            },
          ),
          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                textStyle: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
