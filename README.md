# Flutter Simple Map

A Flutter plugin for displaying a simple flat world map with realtime animated points. 
Can be used as presentation of online users, etc.

[![Build Status](https://travis-ci.org/tiamo/flutter-online-world-map.svg?branch=master)](https://travis-ci.org/tiamo/flutter-online-world-map)
[![Pub package](https://img.shields.io/pub/v/online_world_map.svg)](https://pub.dartlang.org/packages/online_world_map)
[![Star on GitHub](https://img.shields.io/github/stars/tiamo/flutter-online-world-map.svg?style=flat&logo=github&colorB=deeppink&label=stars)](https://github.com/tiamo/flutter-online-world-map)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

![1.gif](https://github.com/tiamo/flutter-online-world-map/raw/master/screens/1.gif)
![2.gif](https://github.com/tiamo/flutter-online-world-map/raw/master/screens/2.gif)

## Getting Started

* Add this to your pubspec.yaml
  ```
  dependencies:
  simple_map: ^0.0.2
  ```
* Get the package from Pub:
  ```
  flutter packages get
  ```
* Import it in your file
  ```
  import 'package:simple_map/simple_map.dart';
  ```

## Features

* Render simple customizable flat map
* Render points with animation effect
* Customize every point
* Create points with TTL
* Good performance with lot of data

## TODO

* Think about StreamController
* Render optimization

## Usage

* Using SimpleMapOptions
```dart
final mapOptions = SimpleMapOptions(
    // You can use your own map image
    mapAsset: 'assets/map.png',
    mapColor: Colors.grey,
    bgColor: Colors.black,
);
```

* Using SimpleMapController
```dart
final SimpleMapController mapController = SimpleMapController();

// Add single point.
mapController.addPoint(SimpleMapPoint());

// Add list of points
mapController.points = [SimpleMapPoint()];

// Clear the map.
mapController.clear();

SimpleMap(
  controller: mapController,
  options: mapOptions,
),
```

* Simple map with one center point with duration of 100 seconds
```dart
SimpleMap(
  controller: SimpleMapController(points: [
    SimpleMapPoint(
      lat: 0.0,
      lng: 0.0,
      color: Colors.blue,
      ttl: Duration(seconds: 100),
    )
  ]),
  options: mapOptions,
),
```

* Check out the complete [Example](https://github.com/tiamo/flutter-online-world-map/tree/master/example)

## Changelog

Please have a look in [CHANGELOG](CHANGELOG.md)

## Maintainers
 
* [Vlad Korniienko](https://github.com/tiamo)
 
## License

[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)