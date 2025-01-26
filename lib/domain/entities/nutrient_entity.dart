class Nutrient {
  final String title;
  final double amount;
  final String unit;
  final double? percentOfDailyNeeds;

  Nutrient({
    required this.title,
    required this.amount,
    required this.unit,
    this.percentOfDailyNeeds,
  });
}