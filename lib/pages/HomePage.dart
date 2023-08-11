import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/buttons.dart';
import 'DashboardPage.dart';
import 'DetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  var userText = TextEditingController();
  var passText = TextEditingController();
  var name = TextEditingController();
  RangeValues rangeValues = const RangeValues(0, 100);

  var _width = 200.0;
  var _height = 100.0;
  var flag = true;
  var containerColor;
  Decoration myDecoration = BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(10)
  );

  var opacity = 1.0;
  var flagOpacity = true;

  bool isFirst = true;

  reload() {
    setState(() {
      if (isFirst) {
        isFirst = false;
      } else {
        isFirst = true;
      }
    });
  }

  late Animation sizeAnimation, colorAnimation;
  late AnimationController animationController;
  var arrRadius = [100.0, 150.0, 200.0, 250.0, 300.0];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // Tween and ColorTween Animation
    sizeAnimation = Tween(begin: 0.0, end: 150.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.green).animate(animationController);

    animationController.addListener(() {
      // print(sizeAnimation.value);
      setState(() {
      });
    });
    animationController.forward();

  }

  callBackFunction() {
    print("Clicked");
  }

  var percent = 10;

  @override
  Widget build(BuildContext context) {

    RangeLabels rangeLabels = RangeLabels(rangeValues.start.toString(), rangeValues.end.toString());
    var arr = [
      'Devansh',
      'Varun',
      'Nidhi',
      'Tanisha',
      'Meet',
      'Mohik',
      'Uttam',
      'Devansh',
      'Varun',
      'Nidhi',
      'Tanisha',
      'Meet',
      'Mohik',
      'Uttam'
    ];
    var dateTime = DateTime.now();

    return

      // Center(
      //   child: SingleChildScrollView(
      //     child: Container(
      //         color: Colors.yellow,
      //         width: 360,
      //         padding: const EdgeInsets.all(10),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             TextField(
      //               // enabled: false,
      //               controller: userText,
      //               keyboardType: TextInputType.text,
      //               decoration: InputDecoration(
      //                   focusedBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: const BorderSide(color: Colors.orange)),
      //                   enabledBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: const BorderSide(
      //                         color: Colors.grey,
      //                       )),
      //                   disabledBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: const BorderSide(
      //                         color: Colors.grey,
      //                       )),
      //                   suffixText: "Username",
      //                   hintText: "Devansh",
      //                   suffixIcon: IconButton(
      //                     icon: const Icon(Icons.person),
      //                     onPressed: () {},
      //                   ),
      //                   prefixIcon: const Icon(
      //                     Icons.email,
      //                     color: Colors.orange,
      //                   )),
      //             ),
      //             TextField(
      //               obscureText: true,
      //               controller: passText,
      //               obscuringCharacter: "*",
      //               keyboardType: TextInputType.number,
      //               decoration: InputDecoration(
      //                   focusedBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: const BorderSide(color: Colors.orange)),
      //                   border: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: const BorderSide(color: Colors.orange)),
      //                   prefixIcon: const Icon(
      //                     Icons.key,
      //                     color: Colors.orange,
      //                   ),
      //                   hintText: "#135asdQwerds",
      //                   suffixText: "Password",
      //                   suffixIcon: const Icon(Icons.remove_red_eye)),
      //             ),
      //             ElevatedButton(
      //                 onPressed: () {
      //                   String user = userText.text.toString();
      //                   String pass = passText.text.toString();
      //
      //                   print("Username $user and Password $pass");
      //                 },
      //                 child: const Padding(
      //                   padding: EdgeInsets.all(8.0),
      //                   child: Text(
      //                     "Login",
      //                     style: TextStyle(fontSize: 20, letterSpacing: 1),
      //                   ),
      //                 )),
      //             Text(
      //               "Current Date & Time: $dateTime",
      //               style: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w700),
      //             ),
      //             Text(
      //               "Hours: ${dateTime.hour}",
      //               style: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w700),
      //             ),
      //             Text(
      //               "Minute: ${dateTime.minute}",
      //               style: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w700),
      //             ),
      //             Text(
      //               "Second: ${dateTime.second}",
      //               style: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w700),
      //             ),
      //             Text(
      //               "Day: ${dateTime.day}",
      //               style: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w700),
      //             ),
      //             Text(
      //               "Month: ${dateTime.month}",
      //               style: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w700),
      //             ),
      //             Text(
      //               "Year: ${dateTime.year}",
      //               style: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w700),
      //             ),
      //             Text(
      //               "Date: ${DateFormat('yMMMMEEEEd').format(dateTime)}",
      //               style: const TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.w700),
      //             ),
      //             OutlinedButton(
      //                 onPressed: () {
      //                   setState(() {});
      //                 },
      //                 child: const Text(
      //                   "Refresh",
      //                   style: TextStyle(fontSize: 18),
      //                 )),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 OutlinedButton(
      //                     onPressed: () async {
      //                       DateTime? datePicked = await showDatePicker(
      //                           context: context,
      //                           initialDate: DateTime.now(),
      //                           firstDate: DateTime(2018),
      //                           lastDate: DateTime(2024));
      //
      //                       if (datePicked != null) {
      //                         print(
      //                             "Selected Date: ${DateFormat('yMMMMEEEEd').format(datePicked)} ");
      //                       }
      //                     },
      //                     child: const Text(
      //                       "Date Picker",
      //                       style: TextStyle(fontSize: 20),
      //                     )),
      //                 OutlinedButton(
      //                     onPressed: () async {
      //                       TimeOfDay? timePicked = await showTimePicker(
      //                         context: context,
      //                         initialTime: TimeOfDay.now(),
      //                         initialEntryMode: TimePickerEntryMode.dialOnly,
      //                       );
      //                       if (timePicked != null) {
      //                         print(
      //                             "Selected Time ${timePicked.hour}: ${timePicked.minute} ");
      //                       }
      //                     },
      //                     child: const Text(
      //                       "Time Picker",
      //                       style: TextStyle(fontSize: 20),
      //                     )),
      //               ],
      //             ),
      //             const Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Text(
      //                   "Selected Date\n",
      //                   style: TextStyle(
      //                       fontSize: 18,
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.w700),
      //                 ),
      //                 Text(
      //                   "Selected Time\n",
      //                   style: TextStyle(
      //                       fontSize: 18,
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.w700),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         )),
      //   ),
      // ),
      // GridView.count(
      //   crossAxisCount: 4,
      //   mainAxisSpacing: 11,
      //   crossAxisSpacing: 11,
      //   children: [
      //     Container(color: Colors.black,),
      //     Container(color: Colors.orange,),
      //     Container(color: Colors.green,),
      //     Container(color: Colors.red,),
      //     Container(color: Colors.blue,),
      //     Container(color: Colors.purple,),
      //     Container(color: Colors.yellow,),
      //   ],
      // )
      // GridView.extent(
      //   maxCrossAxisExtent: 80,
      //   mainAxisSpacing: 11,
      //   crossAxisSpacing: 11,
      //   children: [
      //     Container(color: Colors.black,),
      //     Container(color: Colors.orange,),
      //     Container(color: Colors.green,),
      //     Container(color: Colors.red,),
      //     Container(color: Colors.blue,),
      //     Container(color: Colors.purple,),
      //     Container(color: Colors.yellow,),
      //   ],

      // GridView.builder(
      //   itemBuilder: (context, index) {
      //   return Text(arr[index], style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w700 ),);
      //   },
      //   itemCount: arr.length,
      //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 80,
      //   mainAxisSpacing: 10,
      //   crossAxisSpacing: 10,
      // ),
      // )

      // ElevatedButton(
      //   onPressed: callBackFunction ,
      //   child: const Text("Click", style: TextStyle( fontSize: 20 ),),
      // )

      SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [

          const SizedBox(child: Text("Tween & ColorTween Animation 👇"),),
          Container(
            width: sizeAnimation.value,
            height: sizeAnimation.value,
            color: colorAnimation.value,
          ),
          const SizedBox(height: 20,),

          profileStory(),

          editProfile(),

          boxes(),

          bottom(),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Stack and Positioned 👇"),),
          Stack(
            children: [
              Container(
                width: 250,
                height: 250,
                color: Colors.cyan,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
              Positioned(
                left: 100,
                top: 70,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.greenAccent,
                ),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("From other dart file 👇"),),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Round_Button(
                text: "Play",
                icon:  Icon(Icons.play_arrow_outlined),callback: () {
              print("Play.");
            }, textStyle:  TextStyle( fontSize: 20, fontWeight: FontWeight.w700 )
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Round_Button(
                text: "Pause",
                icon:  Icon(Icons.pause, color: Colors.white,),callback: () {
              print("Play.");
            }, bgColor: Colors.lightBlueAccent, textStyle:  TextStyle( fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white )
            ),
          ),

          const SizedBox(child: Text("Wrap 👇"),),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.spaceEvenly,
            children: [
              Container(
                width: 70,
                height: 50,
                color: Colors.lightBlue,
              ),
              Container(
                width: 70,
                height: 50,
                color: Colors.red,
              ),
              Container(
                width: 70,
                height: 50,
                color: Colors.yellow,
              ),
              Container(
                width: 70,
                height: 50,
                color: Colors.greenAccent,
              ),
              Container(
                width: 70,
                height: 50,
                color: Colors.black87,
              ),
              Container(
                width: 70,
                height: 50,
                color: Colors.orange,
              ),
            ],
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("SizedBox 👇"),),
          Wrap(
            spacing: 10,
            children: [
              SizedBox(
                width: 120,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text("Button", style: TextStyle( fontSize: 20 ),)),
              ),
              SizedBox(
                width: 120,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text("Button", style: TextStyle( fontSize: 20 ),)),
              ),
            ],
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("RichText and Textspan 👇"),),
          RichText(
            text: const TextSpan(
                style: TextStyle( fontSize: 25, color: Colors.grey),
                children: [
                  TextSpan( text: "Hellooo, "),
                  TextSpan( text: "Devansh", style: TextStyle( fontSize: 35, color: Colors.lightBlue, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic ) )
                ]
            ),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Icon Widget 👇"),),
          const Wrap(
            spacing: 10,
            children: [
              Icon(Icons.abc, color: Colors.lightBlue, size: 100,),
              Icon(Icons.accessibility_outlined, size: 50,),
              Icon(Icons.access_alarm),
              Icon(Icons.account_balance),
              Icon(Icons.add_a_photo, size: 80, shadows: [Shadow(
                blurRadius: 100,
                color: Colors.orange,
              )],),
            ],
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Awesome Icon Widget 👇"),),
          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FaIcon(FontAwesomeIcons.folder, color: Colors.lightBlue, size: 80,),
              FaIcon(FontAwesomeIcons.anglesDown, size: 80,),
              FaIcon(FontAwesomeIcons.addressCard, size: 80,),
              FaIcon(FontAwesomeIcons.music, size: 80,),
              FaIcon(FontAwesomeIcons.fingerprint, size: 80,),
              FaIcon(FontAwesomeIcons.amazon, size: 80,),
              FaIcon(FontAwesomeIcons.facebook, size: 80,),
              FaIcon(FontAwesomeIcons.instagram, size: 80,),
              FaIcon(FontAwesomeIcons.whatsapp, size: 80,),
              FaIcon(FontAwesomeIcons.microsoft, size: 80,),
              FaIcon(FontAwesomeIcons.windows, size: 80,),
              FaIcon(FontAwesomeIcons.linux, size: 80,),
              FaIcon(FontAwesomeIcons.amazonPay, size: 80,),
              FaIcon(FontAwesomeIcons.googlePay, size: 80,),
              FaIcon(FontAwesomeIcons.applePay, size: 80,),
            ],
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Constraint Box 👇"),),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 200,
              maxWidth: 300,
              minHeight: 200,
              maxHeight: 300,
            ),
            child: const Text("In common usage and statistics, data (US: /ldrtl/; UK: /ˈdeɪtə/) is a collection of discrete or continuous values that convey information, describing the quantity, quality, fact, statistics, other basic units of meaning, or simply sequences of symbols that may be further interpreted formally. A datum is an individual value in a collection of data. Data is usually organized into structures such as tables that provide additional context and meaning, and which may themselves be used as data in larger structures. Data may be used as variables in a computational process.[1][2] Data may represent abstract ideas or concrete measurements.[3] Data is commonly used in scientific research, economics, and in virtually every other form of human organizational activity. Examples of data sets include price indices (such as consumer price index), unemployment rates, literacy rates, and census data. In this context, data represents the raw facts and figures which can be used in such a manner in order to capture the useful information out of it.",
                style: TextStyle(fontSize: 14), overflow: TextOverflow.fade),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Switch to next page 👇"),),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardPage(name.text.toString())));
              }, child: const Text("Next.", style: TextStyle( fontSize: 25, fontWeight: FontWeight.w700 ),)
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Data Pass from one page to another 👇"),),
          SizedBox(
            width: 300,
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                  hintText: "Enter name and click above Next Button"
              ),
            ),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Range Slider 👇"),),
          RangeSlider(
              values: rangeValues,
              labels: rangeLabels,
              divisions: 10,
              min: 0,
              max: 100,
              onChanged: (newValue){
                rangeValues = newValue;
                print("${newValue.start}, ${newValue.end}");
                setState(() {});
              }
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Foo Animation (Animate Container) 👇"),),
          AnimatedContainer(
              width: _width,
              height: _height,
              curve: Curves.slowMiddle,
              decoration: myDecoration,
              duration: const Duration(seconds: 2)
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (flag) {
                    _width = 100.0;
                    _height = 200.0;
                    flag = false;
                    myDecoration = BoxDecoration(
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.circular(50)
                    );
                  } else {
                    _width = 200.0;
                    _height = 100.0;
                    flag = true;
                    myDecoration = BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(10)
                    );
                  }
                });
              },
              child: const Text("Animate", style: TextStyle( fontSize: 18 ),)),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Animated Opacity (Animate Container) 👇"),),
          AnimatedOpacity(
            opacity: opacity,
            curve: Curves.linearToEaseOut,
            duration: const Duration(seconds: 5),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.cyan,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (flagOpacity) {
                    opacity = 0.0;
                    flagOpacity = false;
                  } else {
                    opacity = 1.0;
                    flagOpacity = true;
                  }
                });
              },
              child: const Text("Animate", style: TextStyle( fontSize: 18 ),)),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Cross Fade Animation (Animate different widgets) 👇"),),
          Column(
            children: [
              AnimatedCrossFade(
                  firstChild: Container(
                    width: 200,
                    height: 100,
                    color: Colors.deepPurple,
                  ),
                  secondChild: Image.asset('assets/images/fastfood.jpg', width: 300, height: 200,),
                  crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  // firstCurve: Curves.slowMiddle,
                  // secondCurve: Curves.bounceInOut,
                  // sizeCurve: Curves.slowMiddle,
                  duration: const Duration(seconds: 3)
              ),
              ElevatedButton(
                  onPressed: () {
                    reload();
                  },
                  child: const Text("Animate", style: TextStyle( fontSize: 18 ),)),
            ],
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Hero Animation (Animate Container) 👇"),),
          Container(
            child: Hero(
                tag: 'background',
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                  },
                  child: Image.asset('assets/images/fastfood.jpg'),
                )
            ),
          ),
          const SizedBox(height: 20,),

          // const SizedBox(child: Text("List Wheel Scrollview (3D List)👇"),),
          // threeD_List(),

          const SizedBox(child: Text("Clip RRECT (For clipping)👇"),),
          ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
              child: Image.asset('assets/images/fastfood.jpg', width: 300, height: 200, fit: BoxFit.fill,)
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Linear Gradient 👇"),),
          Container(
            width: 300,
            height: 100,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow,
                    Colors.red
                  ],
                )
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: 300,
            height: 100,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.red
                  ],
                )
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: 300,
            height: 100,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff84fab0),
                    Color(0xff8fd3f4),
                  ],
                )
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: 300,
            height: 100,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff50cc7f),
                      Color(0xfff5d100),
                      Color(0xffff9b7e)
                    ],
                    begin: FractionalOffset(1.0, 0.5),
                    end: FractionalOffset(0.0, 0.5),
                    stops: [0.0, 0.5, 1.0]
                )
            ),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Radial Gradient 👇"),),
          Container(
            width: 300,
            height: 200,
            decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [
                      Colors.yellow,
                      Colors.red
                    ],
                    center: Alignment.bottomCenter
                )
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: 300,
            height: 200,
            decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [
                      Colors.blue,
                      Colors.red
                    ],
                    center: Alignment.topRight,
                    radius: BorderSide.strokeAlignOutside
                )
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: 300,
            height: 200,
            decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [
                      Color(0xff50cc7f),
                      Color(0xfff5d100),
                      Color(0xffff9b7e)
                    ],
                    center: Alignment.bottomRight,
                    radius: BorderSide.strokeAlignOutside
                )
            ),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("ListView 👇"),),
          SizedBox(
            width: double.maxFinite,
            height: 300,
            child: ListView(
              children: arr.map((value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightBlueAccent
                  ),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(value, style: const TextStyle( fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white, ),),
                  )),
                ),
              )
              ).toList(),
            ),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Loading Button with circular progress 👇"),),
          LoadingBtn(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              color: Colors.yellow,
              borderRadius: 8,
              loader: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(8.0),
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              onTap: ((startLoading, stopLoading, btnState) async {
                if (btnState == ButtonState.idle) {
                  startLoading();
                  await Future.delayed(const Duration(seconds: 5));
                  stopLoading();
                }
              }),
              child: const Text("Loading Button"),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Loading Button with different text 👇"),),
          LoadingBtn(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              color: Colors.redAccent,
              animate: false,
              roundLoadingShape: false,
              loader: const Text("Loading . . .",style: TextStyle( color: Colors.white ),),
              onTap: ((startLoading, stopLoading, btnState) async {
                startLoading();
                await Future.delayed(const Duration(seconds: 5));
                stopLoading();
              }) ,
              child: const Text("Load",style: TextStyle( color: Colors.white ),),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Loading Button with custom loading👇"),),
          LoadingBtn(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.45,
              borderRadius: 8,
              animate: false,
              roundLoadingShape: false,
              color: Colors.deepPurple,
              loader: Container(
                padding: const EdgeInsets.all(8.0),
                child: SpinKitCircle(
                  // size: 20.0,
                  color: Colors.deepPurple.shade100,
                ),
              ),
              onTap: ((startLoading, stopLoading, btnState) async {
                if (btnState == ButtonState.idle) {
                  startLoading();
                  await Future.delayed(const Duration(seconds: 5));
                  stopLoading();
                }
              }),
              child: const Text("Load", style: TextStyle( color: Colors.white ),)
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Circular Percent Indicator👇"),),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: CircularPercentIndicator(
              radius: 90,
              lineWidth: 10.0,
              percent: percent/100,
              animation: true,
              animateFromLastPercent: true,
              progressColor: Colors.red,
              center: Text("${percent.toStringAsFixed(0)} %", style: const TextStyle( fontSize: 20 ),),
            ),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Linear Percent Indicator 👇"),),
          SizedBox(
            width: 250,
            height: 50,
            child: LinearPercentIndicator(
              percent: percent/100,
              lineHeight: 30,
              animation: true,
              animateFromLastPercent: true,
              barRadius: const Radius.circular(20.0),
              progressColor: Colors.lightGreen,
              center: Text("${percent.toStringAsFixed(0)} %", style: const TextStyle( fontSize: 20 ),),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {
                if (percent >=100) {
                  setState(() {
                    percent = 10;
                  });
                } else {
                  setState(() {
                    percent += 10;
                  });
                }
              },
              child: const Text("Increase percent by 10", style: TextStyle( fontSize: 18 ),),
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Flutter Default Toast 👇"),),
          ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "This is Flutter Default toast.",
                  fontSize: 14.0,
                  backgroundColor: Colors.deepPurple.withOpacity(0.8),
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              child: const Text("Show Default Toast", style: TextStyle( fontSize: 18 ),)
          ),
          const SizedBox(height: 20,),

          const SizedBox(child: Text("Custom Toast 👇"),),
          ElevatedButton(
              onPressed: () {
                FToast ftoast = FToast();
                ftoast.init(context);
                Widget toast = Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.alarm),
                      SizedBox(width: 10,),
                      Text("This is custom toast.", style: TextStyle( fontSize: 14, color: Colors.white ),)
                    ],
                  ),
                );
                ftoast.showToast(child: toast, gravity: ToastGravity.CENTER, toastDuration: const Duration(seconds: 4));
              },
              child: const Text("Custome Toast",style: TextStyle( fontSize: 18 ),)
          ),
          const SizedBox(height: 20,),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class profileStory extends StatelessWidget {
  var arr = [
    'Devansh',
    'Varun',
    'Nidhi',
    'Tanisha',
    'Meet',
    'Mohik',
    'Uttam',
    'Devansh',
    'Varun',
    'Nidhi',
    'Tanisha',
    'Meet',
    'Mohik',
    'Uttam'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 360,
      padding: const EdgeInsets.all(2),
      color: Colors.yellow,
      child: ListView.builder(itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Center(child: Text(arr[index], style: const TextStyle( fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.white ), )),
          ),
        );
      },
        itemCount: 7,
        itemExtent: 100,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

}

class editProfile extends StatelessWidget {
  var arr = [
    'Devansh',
    'Varun',
    'Nidhi',
    'Tanisha',
    'Meet',
    'Mohik',
    'Uttam',
    'Devansh',
    'Varun',
    'Nidhi',
    'Tanisha',
    'Meet',
    'Mohik',
    'Uttam'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: 360,
      color: Colors.green,
      child: ListView.separated(
          itemBuilder: (context, index){
            return
              //   Column(
              //   children: [
              //     CircleAvatar(
              //       radius: 50,
              //       backgroundColor: Colors.blueAccent,
              //       child: Center(child: Text(arr[index], style: const TextStyle( fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.white ), )),
              //     ),
              //   ],
              // );
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(arr[index]),
                subtitle: const Text("This is subtitle"),
                trailing: const Icon(Icons.delete),
              );
          },
          separatorBuilder: (context, index) {
            return const Divider(thickness: 1, height: 5);
          },
          itemCount: 7),
    );
  }
}

class boxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 360,
      color: Colors.red,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue
              ),
            ),
          );
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

}

class bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 360,
      color: Colors.lime,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.cyanAccent,
            ),
          );
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

}