abstract class AppStates {}

class AppInitialState extends AppStates {}

class BottomNavigation extends AppStates {}

class NewsBussinessLoodingstate extends AppStates {}

class NewsgetBusinessScussstate extends AppStates {}

class NewsgetBusinessErorrstate extends AppStates {
  final String error;
  NewsgetBusinessErorrstate(this.error);
}

class NewsSportesLoodingstate extends AppStates {}

class NewsgetSportesScussstate extends AppStates {}

class NewsgetSportesErorrstate extends AppStates {
  final String error;
  NewsgetSportesErorrstate(this.error);
}

class NewsScienceLoodingstate extends AppStates {}

class NewsgetScienceScussstate extends AppStates {}

class NewsgetScienceErorrstate extends AppStates {
  final String error;
  NewsgetScienceErorrstate(this.error);
}

class NewsSearchLoodingstate extends AppStates {}

class NewsgetSearchScussstate extends AppStates {}

class NewsgetSearchErorrstate extends AppStates {
  final String error;
  NewsgetSearchErorrstate(this.error);
}

class ChangeModeeState extends AppStates {}
