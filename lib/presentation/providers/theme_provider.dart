import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final StateProvider<bool> darkModeProvider =
    StateProvider<bool>((ref) => false);

// colors
final colorListProvider = Provider((ref) => colorList);
