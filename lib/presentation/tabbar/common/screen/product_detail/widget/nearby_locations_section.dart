import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NearbyLocationsSection extends StatefulWidget {
  const NearbyLocationsSection({super.key});

  @override
  State<NearbyLocationsSection> createState() => _NearbyLocationsSectionState();
}

class _NearbyLocationsSectionState extends State<NearbyLocationsSection> {
  String _selectedTab = 'Transit';

  @override
  Widget build(BuildContext context) {
    final allLocations = {
      'Transit': [
        {
          'name': 'Jb Nagar Metro Station',
          'subtitle': 'Shaheed Bhagat Singh Society',
          'distance': '1.6 KM',
          'icon': Icons.train,
        },
        {
          'name': 'Chakala',
          'subtitle': 'Andheri - Kurla Rd, Amrut Nagar',
          'distance': '2.3 KM',
          'icon': Icons.directions_bus,
        },
      ],
      'Education': [
        {
          'name': 'Shetty Vidyalaya (Powai)',
          'subtitle': 'Ridge Rd, MHADA Colony 20',
          'distance': '2.7 KM',
          'icon': Icons.school,
        },
      ],
      'Entertainment': [
        {
          'name': 'Asalpha Village',
          'subtitle': 'Subhash Nagar, Mohili',
          'distance': '2.9 KM',
          'icon': Icons.movie,
        },
        {
          'name': 'Agarkar Chowk',
          'subtitle': 'Railway Colony, Andheri East',
          'distance': '3.4 KM',
          'icon': Icons.restaurant,
        },
      ],
    };

    final locations = allLocations[_selectedTab] ?? [];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nearby Locations',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 1.5.h),
          Row(
            children: [
              _buildTab('Transit'),
              SizedBox(width: 2.w),
              _buildTab('Education'),
              SizedBox(width: 2.w),
              _buildTab('Entertainment'),
            ],
          ),
          SizedBox(height: 2.h),
          ...locations.map((location) => Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: _buildLocationCard(
                  icon: location['icon'] as IconData,
                  name: location['name'] as String,
                  subtitle: location['subtitle'] as String,
                  distance: location['distance'] as String,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTab(String label) {
    final isActive = _selectedTab == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue[50] : Colors.grey[100],
          borderRadius: BorderRadius.circular(2.w),
          border: Border.all(
            color: isActive ? Colors.blue : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: isActive ? Colors.blue : Colors.grey[700],
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard({
    required IconData icon,
    required String name,
    required String subtitle,
    required String distance,
  }) {
    return Container(
      padding: EdgeInsets.all(3.5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.w),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2.5.w),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Icon(icon, size: 22.sp, color: Colors.grey[700]),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 0.5.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 2.w),
          Text(
            distance,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
