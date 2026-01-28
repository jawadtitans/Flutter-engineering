import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: const BatteryLevelPage()));
}

class FetchingBatteryLevel {
  static const platform = MethodChannel(
    'io.flutter_engineering.battery/method',
  );
  static Future<int?> getBatterylevel() async {
    try {
      final int? batterLevel = await platform.invokeMethod('getBatteryLevel');
      return batterLevel;
    } catch (e) {
      print("Failed to get battery level: '${e}'.");
      return null;
    }
  }
}

class BatteryLevelPage extends StatefulWidget {
  const BatteryLevelPage({Key? key}) : super(key: key);

  @override
  State<BatteryLevelPage> createState() => _BatteryLevelPageState();
}

class _BatteryLevelPageState extends State<BatteryLevelPage> {
  int? _batteryLevel;
  bool _loading = false;

  Future<void> _fetchBatteryLevel() async {
    setState(() => _loading = true);
    final level = await FetchingBatteryLevel.getBatterylevel();
    setState(() {
      _batteryLevel = level;
      _loading = false;
    });
    if (level == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to get battery level')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Battery Level')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _batteryLevel != null
                  ? 'Battery level: $_batteryLevel%'
                  : 'Press the button to fetch battery level',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loading ? null : _fetchBatteryLevel,
              child: _loading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Get Battery Level'),
            ),
          ],
        ),
      ),
    );
  }
}
