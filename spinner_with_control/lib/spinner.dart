import 'package:flutter/material.dart';
import 'dart:math' as math;

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool spin = false;

  void startSpinning() {
    print("HERE@!!!!");
    // _controller.repeat();
    setState(() {
      spin = true;
    });
  }

  void stopSpinning() {
    // _controller.reset();
    setState(() {
      spin = false;
    });
  }

  @override
  void initState() {
    print('IN INIT STATE');
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))..repeat();
  }

  @override
  Widget build(BuildContext context) {
    spin ? startSpinning() : stopSpinning();
    return Column(
      children: [
        RotationTransition(
          turns: spin ? Tween(begin: 0.0, end: 1.0).animate(_controller) : Tween(begin: 0.0, end: 0.0).animate(_controller),
          child: Icon(Icons.stars),
        ),
        RaisedButton(
            child: Text("FREE BEES"),
            onPressed: () => {
                  print("HERE"),
                  print(spin),
                  if (spin == false)
                    {startSpinning()}
                  else if (spin == true)
                    {stopSpinning()}
                }),
      ],
    );
  }
}

//   @override
//   void initState() {
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Transform.rotate(
//           angle: _controller.value * 2 * math.pi,
//           child: Image.asset(
//             "assets/gate.jpg",
//             scale: 0.5,
//           ),
//         ),
//         // RotationTransition(
//         //   turns: Tween(begin: 0.0, end: 2.0).animate(_controller),
//         //   child: Icon(Icons.stars),
//         // ),
//         RaisedButton(
//           child: Text("go"),
//           onPressed: () => _controller.repeat(),
//         ),
//         RaisedButton(
//           child: Text("stop"),
//           onPressed: () => _controller.reset(),
//         ),
//       ],
//     );
//   }
// }
//   @override
//   void initState() {
//     super.initState();

//     _controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 2))
//           ..repeat();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Transform.rotate(
//           angle: _controller.value * 2 * math.pi,
//           child: Image.asset("assets/gate.jpg", scale: 0.5, ),
//         );
//       },
//     );
//   }
// }
