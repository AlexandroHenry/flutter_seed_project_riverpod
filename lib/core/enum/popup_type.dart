enum PopupType {
  none(0),
  oneButton(1),
  twoButton(2),
  ;

  const PopupType(this.value);
  final int value;
}

extension PopupTypeX on String {
  PopupType toPopupType() => PopupType.values.where(
          (value) => value.name == this).first;
}