import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final int initialValue;
  final int maxValue;
  final Duration animationDuration;
  final Color? primaryColor;

  const AnimatedCounter({
    Key? key,
    this.initialValue = 0,
    this.maxValue = 10,
    this.animationDuration = const Duration(milliseconds: 300),
    this.primaryColor,
  }) : super(key: key);

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  void _incrementCounter() {
    if (_currentValue < widget.maxValue) {
      setState(() {
        _currentValue++;
      });
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMax = _currentValue >= widget.maxValue;
    final displayColor = isMax ? Colors.green : (widget.primaryColor ?? Colors.blue);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ScaleTransition(
          scale: _animation,
          child: Text(
            '$_currentValue',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: displayColor,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: isMax ? null : _incrementCounter,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.primaryColor ?? Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text('Добавить', style: TextStyle(color: Colors.white)),
        ),
        if (isMax) ...[
          const SizedBox(height: 8),
          const Text('Максимум досягнуто!', style: TextStyle(color: Colors.green)),
        ]
      ],
    );
  }
}
