import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  final int initNumber;
  final Function(int) counterCallback;
  final Function increaseCallback;
  final Function decreaseCallback;
  final int minNumber;
  CounterView({this.initNumber, this.counterCallback, this.increaseCallback, this.decreaseCallback, this.minNumber});
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _currentCount;
  Function _counterCallback;
  Function _increaseCallback;
  Function _decreaseCallback;
  int _minNumber;

  @override
  void initState() {
    _currentCount = widget.initNumber ?? 1;
    _counterCallback = widget.counterCallback ?? (int number) {};
    _increaseCallback = widget.increaseCallback ?? () {};
    _decreaseCallback = widget.decreaseCallback ?? () {};
    _minNumber = widget.minNumber ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _createIncrementDicrementButton(Icons.remove, () => _dicrement()),
            Text(_currentCount.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            _createIncrementDicrementButton(Icons.add, () => _increment()),
          ],
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > 1) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  Widget _createIncrementDicrementButton(IconData icon, Function onPressed) {

    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: 32.0, minHeight: 32.0),
      onPressed: onPressed,
      elevation: 0,
      fillColor: Colors.grey.shade300,
      child: Icon(
        icon,
        color: Colors.black,
        size: 20.0,
      ),
    );
  }
}