import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            // Using CircleAvatar to create a circular image
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/logo.jpg'), // image path
              radius: 20, // Radius of  the image
            ),
            SizedBox(width: 10),
            Text('CICS Student Conduct'),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.blueAccent.withOpacity(0.1),
                    child: const Row(
                      children: [
                        // Custom Admin Icon
                        AdminIcon(),
                        SizedBox(width: 10),
                        Text(
                          'ADMIN',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Text(
                        'Task Left',
                        style: TextStyle(fontSize: 16),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 0.35,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.green),
                          ),
                          const Text(
                            '35%',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text('SELECT DATE:'),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Policy'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: Card(
                        color: Colors.lightBlueAccent,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'University Mission\n\nA university committed to producing leaders by providing a 21st century learning environment. This is accomplished through collaborations, partnerships, innovative research, community and industry partnerships that create and transfer knowledge and technology, providing mission for the new generation of scientists and professionals who will create a sustainable world for sustainable development.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: Card(
                        color: Colors.lightBlueAccent,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'University Vision\n\nA premier national university that develops leaders in the global knowledge society.\n\nCore Values\n• Patriotism\n• Service\n• Professionalism\n• Innovation\n• Excellence\n• Faith',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/bargraph.png',
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminIcon extends StatelessWidget {
  const AdminIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        shape: BoxShape.circle,
      ),
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.shield_outlined,
            size: 40,
            color: Colors.white,
          ),
          Positioned(
            bottom: 5,
            child: Icon(
              Icons.person,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: DashboardScreen(),
    ));
