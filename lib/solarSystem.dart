import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Celestial extends StatefulWidget {
  @override
  _CelestialState createState() => _CelestialState();
}

class _CelestialState extends State<Celestial> {
  ArCoreController arCoreController;

  ArCoreRotatingNode node;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Devfest\'19'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableTapRecognizer: false,
        ),
      ),
    );
  }

  //0.383 0.949 1 0.2724 0.532 11.21 9.45 4.01 3.88 0.186
  //0.0383, 0.0949, 0.1, 0.02724, 0.0532, 1.121, 0.945, 0.401, 0.388, 0.0186

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addSphere(arCoreController,
        texture: "sun.jpg",
        color: Colors.blue,
        radius: 0.6,
        position: vector.Vector3(0, 0, -1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 0.0);
    _addSphere(arCoreController,
        texture: "mercury.jpg",
        color: Colors.grey,
        radius: 0.05,
        position: vector.Vector3(-0.9, 0, -1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 10.0);
    _addSphere(arCoreController,
        texture: "venus_surface.jpg",
        color: Colors.grey,
        radius: 0.09,
        position: vector.Vector3(-1.2, 0, -1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 10.0);
    _addSphere(arCoreController,
        texture: "earth.jpg",
        color: Colors.grey,
        radius: 0.1,
        position: vector.Vector3(-1.5,0,-1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 10.0);
    _addSphere(arCoreController,
        texture: "moon.jpg",
        color: Colors.grey,
        radius: 0.02,
        position: vector.Vector3(-1.65, 0, -1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 10.0);
    _addSphere(arCoreController,
        texture: "mars.jpg",
        color: Colors.grey,
        radius: 0.0532,
        position: vector.Vector3(-1.8, 0, -1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 10.0);
    _addSphere(arCoreController,
        texture: "jupiter.jpg",
        color: Colors.grey,
        radius: 0.3,
        position: vector.Vector3(-2.5, 0, -1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 10.0);
    _addSphere(arCoreController,
        texture: "saturn.jpg",
        color: Colors.grey,
        radius: 0.25,
        position: vector.Vector3(-3.8, 0, -1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 10.0);
    _addSphere(arCoreController,
        texture: "uranus.jpg",
        color: Colors.grey,
        radius: 0.15,
        position: vector.Vector3(-4.4, 0, -1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 10.0);
    _addSphere(arCoreController,
        texture: "neptune.jpg",
        color: Colors.grey,
        radius: 0.12,
        position: vector.Vector3(-5.0, 0, -1.5),
        rotation: vector.Vector4(0, 0, 0, 0),
        dps: 10.0);
  }

  void _addSphere(ArCoreController controller,
      {String texture,
      Color color,
      double radius,
      vector.Vector3 position,
      vector.Vector4 rotation,
      double dps = 0.0}) {
    final material = ArCoreMaterial(
      color: color,
      texture: texture,
    );

    final celestial = ArCoreSphere(
      materials: [material],
      radius: radius,
    );

    node = ArCoreRotatingNode(
      shape: celestial,
      position: position,
      rotation: rotation,
    );

    node.degreesPerSecond.value = dps;

    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController?.dispose();
    super.dispose();
  }
}