import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example notification data
    final List<Map<String, String>> notifications = [
      {
        'title': 'System Update',
        'message': 'A new system update is available.',
        'time': '5 mins ago'
      },
      {
        'title': 'Reminder',
        'message': 'Don\'t forget to verify your product today!',
        'time': '2 hours ago'
      },
      {
        'title': 'Welcome!',
        'message': 'Thanks for signing up. Let\'s get started.',
        'time': '1 day ago'
      },
      {
        'title': 'Promotion',
        'message': 'Check out our new discount offers on selected items.',
        'time': '3 days ago'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notifications',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: notifications.isNotEmpty
          ? ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.notifications, color: Theme.of(context).primaryColor),
              title: Text(
                notification['title'] ?? 'No Title',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                notification['message'] ?? 'No Message',
              ),
              trailing: Text(
                notification['time'] ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          );
        },
      )
          : Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'No Notifications',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
