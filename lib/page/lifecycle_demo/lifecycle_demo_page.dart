import 'package:flutter/material.dart';

class LifeCycleDemoPage extends StatefulWidget {
  final String title;

  const LifeCycleDemoPage({Key? key, required this.title}) : super(key: key);

  @override
  _LifeCycleDemoPageState createState() => _LifeCycleDemoPageState();
}

class _LifeCycleDemoPageState extends State<LifeCycleDemoPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    debugPrint("============ initState");
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("============ didChangeAppLifecycleState ========= $state");
    if (state == AppLifecycleState.resumed) {
      debugPrint(
          "============ didChangeAppLifecycleState ========= checking for user auth");
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    debugPrint("============ didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LifeCycleDemoPage oldWidget) {
    debugPrint("============ didUpdateWidget");
    if (oldWidget.title != widget.title) {
      // DO something...
      debugPrint("============ didUpdateWidget - title changed");
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("============ build");
    return Text(widget.title);
  }

  @override
  void deactivate() {
    debugPrint("============ deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("============ dispose");
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}
