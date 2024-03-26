import 'package:flutter/widgets.dart';

const _kColorWhite = const Color(0xFFFFFFFF);

class SimpleMapMarker {
  const SimpleMapMarker({
    this.lat = 0.0,
    this.lng = 0.0,
    this.radius = 10.0,
    this.color = _kColorWhite,
    this.image,
    this.otherInfo,
  });

  /// Latitude
  final double lat;

  /// Longitude
  final double lng;

  /// Marker radius
  final double radius;

  /// Marker color
  final Color color;

  /// Marker image
  final ImageProvider? image;

  /// Other Info
  final dynamic otherInfo;

  @override
  String toString() {
    return '$runtimeType {radius: $radius, lat: $lat, lng: $lng, radius: $radius, color: $color}';
  }
}

class SimpleMarkerPainter extends CustomPainter {
  const SimpleMarkerPainter({
    this.color = _kColorWhite,
  });

  /// Marker background color
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width * 1.000004, size.height * 0.4109621)
      ..cubicTo(size.width * 1.000004, size.height * 0.1865600, size.width * 0.7801875, size.height * 0.004645000, size.width * 0.5090333,
          size.height * 0.004645000)
      ..cubicTo(size.width * 0.2378804, size.height * 0.004645000, size.width * 0.01806642, size.height * 0.1865600, size.width * 0.01806642,
          size.height * 0.4109621)
      ..cubicTo(size.width * 0.01806642, size.height * 0.6574069, size.width * 0.3166987, size.height * 0.8147586, size.width * 0.5090333,
          size.height * 0.9723000)
      ..cubicTo(size.width * 0.7013667, size.height * 0.8147586, size.width * 1.000004, size.height * 0.6574069, size.width * 1.000004,
          size.height * 0.4109621)
      ..close();

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Widget defaultMarkerBuilder(SimpleMapMarker m, Offset offset) {
  const border = 1.4;
  final width = m.radius * 2;
  final size = Size(width, width * 1.21);
  return Positioned(
    top: offset.dy - size.height + 0.6,
    left: offset.dx - m.radius - 0.2,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        CustomPaint(
          painter: SimpleMarkerPainter(color: m.color),
          size: size,
        ),
        Container(
          width: size.width - border * 2,
          height: size.width - border * 2,
          margin: const EdgeInsets.only(top: border),
          decoration: BoxDecoration(
            image: m.image != null ? DecorationImage(image: m.image!, fit: BoxFit.cover) : null,
            shape: BoxShape.circle,
            color: _kColorWhite.withOpacity(0.7),
          ),
        )
      ],
    ),
  );
}
