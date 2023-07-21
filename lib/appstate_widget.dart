/// Making [StatefulWidget] prettier and less boilerplate.
library appstate_widget;

import 'package:flutter/material.dart';

/// Making [StatefulWidget] prettier and less boilerplate.
///
/// Though this doesn't support [AppStateValue.setState] one of the suggested
/// workaround is making an extended class of [ValueNotifier] and build it with
/// [ValueListenableBuilder].
class AppStateWidget extends StatefulWidget {
  /// Default constant constructor with one field of [key].
  ///
  /// To use it, you're going to need extending this class
  /// ```dart
  /// class MyClass extends AppStateWidget {
  ///   const MyClass({super.key});
  ///
  ///   @override
  ///   Map<String, dynamic> data(AppStateValue state){
  ///     return {"controller": TextEditingController()};
  ///   }
  ///
  ///   @override
  ///   void onPreparation(AppStateValue state){
  ///     state.data['controller'].text = 'Loading';
  ///   }
  ///
  ///   @override
  ///   Widget onStart(AppStateValue state){
  ///     return TextField(controller: state.data['controller']);
  ///   }
  ///
  ///   void onReady(AppStateValue state){
  ///     state.data['controller'].text = 'Loaded';
  ///   }
  ///
  ///   @override
  ///   void onFinish(AppStateValue state){
  ///     state.data['controller'].dispose();
  ///   }
  /// }
  /// ```
  const AppStateWidget({super.key});

  /// Overriding [AppStateValue.build] inside [createState].
  Widget onStart(AppStateValue state) => const Placeholder();

  /// A map to declare and passing data inside class. This make things cleaner.
  Map<String, dynamic> data(AppStateValue state) => {"message": "Hello World"};

  /// Overriding [AppStateValue.dispose] inside [createState].
  void onFinish(AppStateValue state) {}

  /// Overriding [AppStateValue.initState] inside [createState].
  void onPreparation(AppStateValue state) {}

  ///  Overriding [WidgetsBinding] after [AppStateValue.build] has been done.
  void onReady(AppStateValue state) {}

  @override
  State<AppStateWidget> createState() => AppStateValue();
}

/// State child class of [AppStateWidget].
class AppStateValue extends State<AppStateWidget> {
  late Map<String, dynamic> data = widget.data(this);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.onReady(this));
    return widget.onStart(this);
  }

  @override
  void initState() {
    super.initState();
    widget.onPreparation(this);
  }

  @override
  void dispose() {
    widget.onFinish(this);
    super.dispose();
  }
}
