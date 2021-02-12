part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();
}

class HomeState extends BottomNavigationBarState {
  final int index = 0;

  @override
  List<Object> get props => [index];
}

class MarketState extends BottomNavigationBarState {
  final int index = 1;

  @override
  List<Object> get props => [index];
}

class ActivityState extends BottomNavigationBarState {
  final int index = 2;

  @override
  List<Object> get props => [index];
}

class AccountState extends BottomNavigationBarState {
  final int index = 3;

  @override
  List<Object> get props => [index];
}
