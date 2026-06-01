import 'package:flutter/material.dart';

import '../core/app_texts.dart';
import '../core/app_theme.dart';

class AbstractApiPanel extends StatelessWidget {
  const AbstractApiPanel({required this.copy, super.key});

  final AppTexts copy;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: context.elevatedSurface.withValues(
          alpha: context.isDarkMode ? .82 : .9,
        ),
        border: Border.all(color: context.fineBorder),
        boxShadow: context.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _StatusDot(color: context.premiumGold),
              const SizedBox(width: 8),
              _StatusDot(color: context.softSurface),
              const SizedBox(width: 8),
              _StatusDot(color: context.primaryText.withValues(alpha: .28)),
              const Spacer(),
              Icon(
                Icons.lock_outline_rounded,
                size: 18,
                color: context.premiumGold,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(copy.panelTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            copy.panelSubtitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          const _EndpointBar(method: 'GET', path: '/customer/profile'),
          const SizedBox(height: 12),
          const _EndpointBar(method: 'POST', path: '/notifications/push'),
          const SizedBox(height: 22),
          SizedBox(
            height: 154,
            child: CustomPaint(
              painter: _FlowPainter(
                lineColor: context.premiumGold.withValues(alpha: .54),
                nodeColor: context.primaryText,
                fillColor: context.softSurface,
              ),
              child: const SizedBox.expand(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _MetricPill(label: copy.panelMetricOne, value: '98%'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MetricPill(label: copy.panelMetricTwo, value: '24'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MetricPill(label: copy.panelMetricThree, value: '12'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _EndpointBar extends StatelessWidget {
  const _EndpointBar({required this.method, required this.path});

  final String method;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: context.softSurface.withValues(
          alpha: context.isDarkMode ? .52 : .58,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.fineBorder),
      ),
      child: Row(
        children: [
          Text(
            method,
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: context.premiumGold),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              path,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
                color: context.primaryText,
              ),
            ),
          ),
          Icon(
            Icons.check_circle_outline_rounded,
            color: context.premiumGold,
            size: 18,
          ),
        ],
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: context.fineBorder),
      ),
      child: Column(
        children: [
          Text(value, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(label, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _FlowPainter extends CustomPainter {
  const _FlowPainter({
    required this.lineColor,
    required this.nodeColor,
    required this.fillColor,
  });

  final Color lineColor;
  final Color nodeColor;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.4
      ..style = PaintingStyle.stroke;
    final nodePaint = Paint()..color = fillColor;
    final borderPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final points = [
      Offset(size.width * .12, size.height * .5),
      Offset(size.width * .36, size.height * .26),
      Offset(size.width * .62, size.height * .5),
      Offset(size.width * .86, size.height * .28),
      Offset(size.width * .86, size.height * .74),
    ];

    for (var i = 0; i < points.length - 1; i++) {
      final path = Path()
        ..moveTo(points[i].dx, points[i].dy)
        ..cubicTo(
          points[i].dx + 38,
          points[i].dy,
          points[i + 1].dx - 38,
          points[i + 1].dy,
          points[i + 1].dx,
          points[i + 1].dy,
        );
      canvas.drawPath(path, linePaint);
    }

    for (final point in points) {
      canvas.drawCircle(point, 18, nodePaint);
      canvas.drawCircle(point, 18, borderPaint);
      canvas.drawCircle(
        point,
        4,
        Paint()..color = nodeColor.withValues(alpha: .68),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _FlowPainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.nodeColor != nodeColor ||
        oldDelegate.fillColor != fillColor;
  }
}
