part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();
}

class LoadHome extends BottomNavigationBarEvent{
  @override
  List<Object> get props => [];

}
class LoadMarket extends BottomNavigationBarEvent{
  @override
  List<Object> get props => [];

}
class LoadActivity extends BottomNavigationBarEvent{
  @override
  List<Object> get props => [];

}
class LoadAccount extends BottomNavigationBarEvent{
  @override
  List<Object> get props => [];

}
