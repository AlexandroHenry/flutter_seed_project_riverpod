enum EnvType {
  prod(0),
  stg(1),
  dev(2),
  test(3),
  ;

  const EnvType(this.value);

  final int value;
}

extension EnvTypeeX on String {
  EnvType toEnvType() {
    var result = EnvType.values.where(
            (value) => value.name.toLowerCase() == toLowerCase());
    return result.isEmpty ? EnvType.prod : result.first;
  }
}