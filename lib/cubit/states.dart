abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopBottomNavState extends ShopStates {}

class ShopGetBusinessLoadingState extends ShopStates {}

class ShopGetBusinessSuccessState extends ShopStates {}

class ShopGetBusinessErrorState extends ShopStates
{
  late final String error;

  ShopGetBusinessErrorState(this.error);
}

class ShopGetSportsLoadingState extends ShopStates {}

class ShopGetSportsSuccessState extends ShopStates {}

class ShopGetSportsErrorState extends ShopStates
{
  late final String error;

  ShopGetSportsErrorState(this.error);
}

class ShopGetScienceSuccessState extends ShopStates {}

class ShopGetScienceLoadingState extends ShopStates {}

class ShopGetScienceErrorState extends ShopStates
{
  late final String error;

  ShopGetScienceErrorState(this.error);
}


class ShopGetSearchSuccessState extends ShopStates {}

class ShopGetSearchLoadingState extends ShopStates {}

class ShopGetSearchErrorState extends ShopStates
{
  late final String error;

  ShopGetSearchErrorState(this.error);
}

class ShopChangeThemeState extends ShopStates {}
