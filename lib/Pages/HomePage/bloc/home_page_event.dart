
abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDotsEvent extends HomePageEvent {
  final int index;

  const HomePageDotsEvent(this.index);
}
