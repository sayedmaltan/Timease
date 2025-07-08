import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:timease_mobile/constants.dart';
import '../../data/models/notifications_model.dart';

class NotificationDetailsScreen extends StatelessWidget {
  final Notifications notification;

  const NotificationDetailsScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final createdAt = notification.createdAt != null
        ? DateFormat.yMMMMd()
            .add_jm()
            .format(DateTime.parse(notification.createdAt!))
        : 'Date not available';

    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            padding: EdgeInsets.all(10),
            color: kPrimaryColor,
            width: double.infinity,
            height: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Notification Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title ?? "No Title Provided",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Received on: $createdAt',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Divider(height: 30, thickness: 1.5),
                    Text(
                      notification.message ?? "No message content.",
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (notification.notificationType != null) ...[
                      const Divider(height: 20, thickness: 0.8),
                      _buildDetailRow(
                        context,
                        "Type:",
                        notification.notificationType!.replaceAll('_', ' '),
                        Icons.category,
                      ),
                    ],
                    if (notification.payload != null) ...[
                      const Divider(height: 20, thickness: 0.8),
                      _buildDetailRow(
                        context,
                        "Payload ID:",
                        notification.payload!,
                        Icons.link,
                      ),
                    ],
                    if (notification.isSent != null) ...[
                      const Divider(height: 20, thickness: 0.8),
                      _buildDetailRow(
                        context,
                        "Status:",
                        notification.isSent! ? "Delivered" : "Pending",
                        notification.isSent!
                            ? Icons.check_circle_outline
                            : Icons.pending_actions,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
      BuildContext context, String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey[700], size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                SelectableText(
                  // Allows selecting text for copying
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
