import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:amicons/amicons.dart';
import 'package:bedr/presentation/tabbar/screen/filter/provider/search_provider.dart';
import 'package:bedr/presentation/tabbar/screen/filter/provider/filter_provider.dart';
import 'package:bedr/presentation/tabbar/screen/filter/widget/filter_bottom_sheet.dart';
import 'package:bedr/presentation/common/widgets/property_card.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  late final SearchNotifier _searchNotifier;
  late final FilterNotifier _filterNotifier;
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchNotifier = ref.read(searchProvider); // Use global provider
    _filterNotifier = ref.read(filterProvider);
    
    // Initialize with preserved state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchNotifier.initializeIfNeeded();
      // Set the text controller with preserved query
      _searchController.text = _searchNotifier.value.query;
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    // Don't dispose _searchNotifier as it's a global provider
    super.dispose();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    ).then((_) {
      final filterState = _filterNotifier.value;
      _searchNotifier.applyFilters(
        selectedGender: filterState.selectedGender,
        propertyTypes: filterState.propertyTypes,
        roomTypes: filterState.roomTypes,
        budgetRange: filterState.budgetRange,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _searchFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(4.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.w),
                          border: Border.all(color: Colors.grey[300]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          focusNode: _searchFocusNode,
                          onChanged: _searchNotifier.updateQuery,
                          style: TextStyle(fontSize: 15.sp),
                          decoration: InputDecoration(
                            hintText: 'Search location, property...',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15.sp,
                            ),
                            prefixIcon: Icon(
                              Amicons.iconly_search,
                              color: Colors.grey[400],
                              size: 20.sp,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 1.5.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    GestureDetector(
                      onTap: _showFilterBottomSheet,
                      child: Container(
                        height: 6.h,
                        width: 6.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(3.w),
                        ),
                        child: Icon(
                          Amicons.iconly_filter,
                          color: Colors.grey[700],
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _searchNotifier,
                  builder: (context, state, _) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.error != null) {
                      return Center(
                        child: Text(
                          state.error!,
                          style: TextStyle(fontSize: 14.sp, color: Colors.red),
                        ),
                      );
                    }

                    if (state.properties.isEmpty && state.query.isEmpty) {
                      return Center(
                        child: Text(
                          'Search for properties',
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                        ),
                      );
                    }

                    if (state.properties.isEmpty && state.query.isNotEmpty) {
                      return Center(
                        child: Text(
                          'No properties found',
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      itemCount: state.properties.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: PropertyCard(property: state.properties[index]),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
