import 'package:bloodbond/app/app.dart';
import 'package:bloodbond/bootstrap.dart';
import 'package:bloodbond/flavors.dart';

Future<void> main() async {
  await bootstrap(
    () {
      return const App();
    },
    Flavor.QA,
  );
}
