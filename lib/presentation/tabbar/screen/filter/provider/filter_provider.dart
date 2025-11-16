import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterState {
  final String? selectedGender; // Changed to single selection
  final List<String> propertyTypes;
  final List<String> roomTypes;
  final RangeValues budgetRange;

  FilterState({
    this.selectedGender, // Single gender selection
    this.propertyTypes = const [],
    this.roomTypes = const [],
    this.budgetRange = const RangeValues(5000, 50000),
  });

  FilterState copyWith({
    String? selectedGender,
    List<String>? propertyTypes,
    List<String>? roomTypes,
    RangeValues? budgetRange,
  }) {
    return FilterState(
      selectedGender: selectedGender ?? this.selectedGender,
      propertyTypes: propertyTypes ?? this.propertyTypes,
      roomTypes: roomTypes ?? this.roomTypes,
      budgetRange: budgetRange ?? this.budgetRange,
    );
  }
}

class FilterNotifier extends ValueNotifier<FilterState> {
  FilterNotifier() : super(FilterState());

  void selectGender(String? gender) {
    value = value.copyWith(selectedGender: gender);
  }

  void togglePropertyType(String type) {
    final list = List<String>.from(value.propertyTypes);
    list.contains(type) ? list.remove(type) : list.add(type);
    value = value.copyWith(propertyTypes: list);
  }

  void toggleRoomType(String type) {
    final list = List<String>.from(value.roomTypes);
    list.contains(type) ? list.remove(type) : list.add(type);
    value = value.copyWith(roomTypes: list);
  }

  void setBudgetRange(RangeValues range) {
    value = value.copyWith(budgetRange: range);
  }

  void clearAll() {
    value = FilterState();
  }
}

final filterProvider = Provider<FilterNotifier>((ref) {
  final notifier = FilterNotifier();
  ref.onDispose(() => notifier.dispose());
  return notifier;
});
