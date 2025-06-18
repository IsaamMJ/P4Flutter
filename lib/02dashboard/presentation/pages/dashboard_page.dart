import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

// DashboardPage - Displays the main dashboard UI
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1C1C1E), Color(0xFF8B0000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _HeaderSection(),  // Modularized Header
                const SizedBox(height: 30),
                const _StatsSection(),   // Modularized Stats and Animation
                const SizedBox(height: 40),
                Expanded(child: _ActionCardsSection()), // Modularized Action Cards
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Header Section - Displays Welcome message and Logout button
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back!',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
              Text(
                'Here’s what’s happening today:',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () => Get.offAllNamed('/login'),
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade700,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// Stats Section - Shows stats like tasks completed and pending alerts
class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStatCard(
          icon: Icons.assignment_turned_in_outlined,
          label: 'Tasks Completed',
          value: '24',
          color: Colors.green.shade400,
        ),
        const SizedBox(width: 24),
        _buildStatCard(
          icon: Icons.warning_amber_rounded,
          label: 'Pending Alerts',
          value: '5',
          color: Colors.amberAccent.shade700,
        ),
        const SizedBox(width: 24),
        SizedBox(
          height: 80,
          width: 80,
          child: Lottie.asset(
            'assets/animations/tools.json',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  // Helper method to build each stat card
  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Action Cards Section - Displays clickable action cards
class _ActionCardsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionCard(
          title: 'Work Orders',
          description: 'Manage maintenance requests and status.',
          iconPath: 'assets/animations/workorder.json',
          onTap: () => Get.toNamed('/workorders'),
        ),
        _buildActionCard(
          title: 'Notifications',
          description: 'View critical system alerts and messages.',
          iconPath: 'assets/animations/notification.json',
          onTap: () => Get.toNamed('/notifications'),
        ),
      ],
    );
  }

  // Helper method to build each action card
  Widget _buildActionCard({
    required String title,
    required String description,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 260,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.65),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.red.shade800, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                iconPath,
                height: 80,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
