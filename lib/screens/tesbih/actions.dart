import 'package:azkar_plus/screens/tesbih/tesbih_screen.dart';

import '../../theme/services/counter_prefs.dart';

class CounterPrefsActions {
  void resetTotalCount() {
    // resets the total counter value
    CounterPrefs.clearTotalCount();
  }

  void addTotalCount() async {
    //adds the count to total counter value
    await CounterPrefs.setTotalCount(CounterPrefs.getTotalCount()! + counter);
  }

  int getTotalCount() {
    //returns the total counter value
    return CounterPrefs.getTotalCount() ?? 0;
  }
}

// class CounterActions {
//   void updateCounter() {
//     //updates both counter and total counter value
//     // setState(() {
//     counter = counter + 1;
//     totalCount = totalCount + 1;
//     // });
//   }

//   void resetCounter() {
//     CounterPrefsActions().addTotalCount();

//     // resets the counter value
//     // setState(() {
//     counter = 0;
//     // });
//   }

//   void resetTotalCounter() {
//     // setState(() {
//     CounterPrefsActions().resetTotalCount();
//     totalCount = 0;
//     counter = 0;
//     // });
//   }
// }
