enum MainTabEnum {
  orders,
  menu,
  cart;

  static MainTabEnum fromIndex(int index) {
    if (index >= 0 && index < MainTabEnum.values.length) {
      return MainTabEnum.values[index];
    }
    return MainTabEnum.menu;
  }
}
