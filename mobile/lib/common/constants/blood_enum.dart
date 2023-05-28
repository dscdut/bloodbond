
enum BloodIngredientUnit {
  mol('mmol/L'),
  ml('ml/L'),
  fl('fl'),
  bl('bL');

  const BloodIngredientUnit(this.name);

  final String name;
}

enum BloodIngredientType {
  glucose('Glucose'),
  cholesterol('Cholesterol'),
  bilirubin('Bilirubin'),
  rbc('RBC'),
  mcv('MCV'),
  platelets('Platelets');

  const BloodIngredientType(this.name);

  final String name;
}

enum BloodType {
  aPlus('A+'),
  aMinus('A-'),
  bPlus('B+'),
  bMinus('B-'),
  oPlus('O+'),
  abPlus('AB+'),
  abMinus('AB-');

  const BloodType(this.name);

  final String name;
}
