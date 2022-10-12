import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation sizeAnimation;
  int slider_Val = 100;
  int _weight = 50;
  int _age = 20;
  int _malecolor = 0;
  int _femalecolor = 0;
  int _weightadd = 0;
  int _weightremove = 0;
  int _ageadd = 0;
  int _ageremove = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 9,
      ),
    );

    sizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 580, end: 700), weight: 3),
      TweenSequenceItem(tween: Tween<double>(begin: 700, end: 600), weight: 3),
      TweenSequenceItem(tween: Tween<double>(begin: 600, end: 900), weight: 2),
      TweenSequenceItem(tween: Tween<double>(begin: 900, end: 700), weight: 3),
      TweenSequenceItem(tween: Tween<double>(begin: 700, end: 900), weight: 3),
      TweenSequenceItem(tween: Tween<double>(begin: 900, end: 700), weight: 3),
      TweenSequenceItem(tween: Tween<double>(begin: 700, end: 900), weight: 3),
    ]).animate(animationController);

    // sizeAnimation = Tween<double>(begin: 580, end: 900).animate(
    //     CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff090E21),
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff090E21),
      ),
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, widget) {
            return Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            onTap: () {
                              setState(() {
                                _femalecolor = 1;
                                _malecolor = 0;
                              });
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 5, bottom: 10),
                              decoration: BoxDecoration(
                                color: (_femalecolor == 0)
                                    ? const Color(0xff1D1E33)
                                    : const Color(0xff3B3C4D),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.woman,
                                    size: 100,
                                    color: (_femalecolor == 0)
                                        ? Colors.white
                                        : Colors.red,
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      color: (_femalecolor == 0)
                                          ? Colors.white
                                          : Colors.red,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4),
                            onTap: () {
                              setState(() {
                                _malecolor = 1;
                                _femalecolor = 0;
                              });
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 5, bottom: 10),
                              decoration: BoxDecoration(
                                color: (_malecolor == 0)
                                    ? const Color(0xff1D1E33)
                                    : const Color(0xff3B3C4D),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.man,
                                    size: 100,
                                    color: (_malecolor == 0)
                                        ? Colors.white
                                        : Colors.red,
                                  ),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      color: (_malecolor == 0)
                                          ? Colors.white
                                          : Colors.red,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Container(
                      // margin: EdgeInsets.only(left: 20, right: 24),
                      decoration: BoxDecoration(
                        color: const Color(0xff1D1E33),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 2),
                          const Text(
                            "HEIGHT",
                            style: TextStyle(
                              color: Color(0xff626473),
                            ),
                          ),
                          const Spacer(flex: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$slider_Val',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 52,
                                ),
                              ),
                              Container(
                                height: 100,
                                alignment: const Alignment(0, 0.2),
                                child: const Text(
                                  "cm",
                                  style: TextStyle(
                                    color: Colors.white24,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Spacer(flex: 1),
                          Slider(
                            value: slider_Val.toDouble(),
                            onChanged: (val) {
                              setState(() {
                                slider_Val = val.toInt();
                              });
                            },
                            min: 100,
                            max: 300,
                            thumbColor: const Color(0xffeb1555),
                            activeColor: const Color(0xfff5c1d1),
                            inactiveColor: const Color(0xff555555),
                          ),
                          const Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xff1D1E33),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Weight',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '$_weight',
                                  style: const TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Spacer(flex: 2),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (_weight > 0) _weight--;
                                          _weightremove = 1;
                                          _weightadd = 0;
                                        });
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (_weightremove == 0)
                                              ? const Color(0xff4C4F5E)
                                              : const Color(0xff6E6F7A),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.remove,
                                          color: (_weightremove == 0)
                                              ? Colors.white
                                              : const Color(0xffF67FA4),
                                        ),
                                      ),
                                    ),
                                    const Spacer(flex: 1),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _weight++;
                                          _weightremove = 0;
                                          _weightadd = 1;
                                        });
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (_weightadd == 1)
                                              ? const Color(0xff6E6F7A)
                                              : const Color(0xff4C4F5E),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(Icons.add,
                                            color: (_weightadd == 1)
                                                ? const Color(0xffF67FA4)
                                                : Colors.white),
                                      ),
                                    ),
                                    const Spacer(flex: 2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, top: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xff1D1E33),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Age',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '$_age',
                                  style: const TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Spacer(flex: 2),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (_age > 0) _age--;
                                          _ageremove = 1;
                                          _ageadd = 0;
                                        });
                                      },
                                      child: Ink(
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (_ageremove == 0)
                                                ? const Color(0xff4C4F5E)
                                                : const Color(0xff6E6F7A),
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.remove,
                                            color: (_ageremove == 0)
                                                ? Colors.white
                                                : const Color(0xffF67FA4),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(flex: 1),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _age++;
                                          _ageremove = 0;
                                          _ageadd = 1;
                                        });
                                      },
                                      child: Ink(
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (_ageadd == 0)
                                                ? const Color(0xff4C4F5E)
                                                : const Color(0xff6E6F7A),
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.add,
                                            color: (_ageadd == 0)
                                                ? Colors.white
                                                : const Color(0xffF67FA4),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(flex: 2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    borderRadius: BorderRadius.circular(26),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xff4c4f5e),
                              content: Container(
                                height: 300,
                                width: 300,
                                color: const Color(0xff4c4f5e),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Center(
                                      child: Text(
                                        "Your BMI",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Bmi(),
                                    ),
                                    const Text(
                                      " Normal(Healthy Weight)",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "BACK",
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: width,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: const Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Bmi() {
    dynamic finalWeight = slider_Val / 100;
    dynamic bmi = _weight / (finalWeight * finalWeight);
    return Text(
      bmi.toStringAsFixed(2),
      style: const TextStyle(
        fontSize: 60,
        color: Colors.white,
      ),
    );
  }
}
