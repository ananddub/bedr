import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(4.w),
          children: [
            SizedBox(height: 2.h),
            
            // Profile
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.sp,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 35.sp, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 2.h),
                  Text('Guest User', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  Text('guest@bedr.com', style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                ],
              ),
            ),

            SizedBox(height: 4.h),

            // Account Settings
            _buildContainer([
              _tile(Icons.person_outline, 'Edit Profile', '', () {}),
              _tile(Icons.notifications_outlined, 'Notifications', '', () {}),
            ]),

            SizedBox(height: 2.5.h),

            // App Settings
            _buildContainer([
              _tile(Icons.location_on_outlined, 'Location', '', () {}),
              _tile(Icons.language, 'Language', '', () {}),
            ]),

            SizedBox(height: 3.h),

            // Support
            _buildContainer([
              _tile(Icons.help_outline, 'Help & Support', '', () {}),
              _tile(Icons.privacy_tip_outlined, 'Privacy Policy', '', () {}),
              _tile(Icons.info_outline, 'About', '', () {}),
            ]),
            
            SizedBox(height: 3.h),
            
            // Logout
            _buildContainer([
              _tile(Icons.logout, 'Logout', '', () {}, 
                   color: AppTheme.btnColor, showArrow: false),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(List<Widget> tiles) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(3.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: tiles.asMap().entries.map((entry) {
          final index = entry.key;
          final tile = entry.value;
          
          return Column(
            children: [
              tile,
              if (index < tiles.length - 1)
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey[200],
                  indent: 16.w,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _tile(IconData icon, String title, String subtitle, VoidCallback onTap, 
              {Color? color, bool showArrow = true}) {
    return ListTile(
      dense: true,
      leading: Icon(
        icon, 
        color: color ?? Colors.grey[700],
        size: 20.sp,
      ),
      title: Text(
        title, 
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: showArrow 
          ? Icon(
              Icons.arrow_forward_ios, 
              size: 14.sp,
              color: Colors.grey[400],
            )
          : null,
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 0,
      ),
      minVerticalPadding: 1.h,
    );
  }
}
