import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Movies',
                      // style: GoogleFonts.montserrat(
                      //   textStyle: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      //),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.settings_outlined),
                        SizedBox(width: 25.0),
                        Icon(
                          Icons.supervised_user_circle,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Color(0xffffa301),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Center(
                            child: Text(
                          'Now Showing',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Color(0xfff7f7f7),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6.0),
                            bottomRight: Radius.circular(6.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Coming soon',
                            style: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                child: MyContainer(
                  imagePath: 'assets/images/hardkill.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                child: MyContainer(
                  imagePath: 'assets/images/2067.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                child: MyContainer(
                  imagePath: 'assets/images/enola_holmes.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                child: MyContainer(
                  imagePath: 'assets/images/picture_perfect.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                child: MyContainer(
                  imagePath: 'assets/images/the_witches.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                child: MyContainer(
                  imagePath: 'assets/images/wellcome_to_sudden_death.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
class MyContainer extends StatelessWidget {
  final String imagePath;

  MyContainer({this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),

        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 20.0,
            spreadRadius: 10.0,
            offset: Offset(3, 9),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [
              Colors.black12.withOpacity(0.3),
              Colors.black12.withOpacity(0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                      child: Text(
                        '8.5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 45.0,
                    color: Colors.pink,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'Hard Kill',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  '1h 30mins             20 Sept',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Action',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          height: 25.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Horror',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Color(0xffffa301),
                      child: Text(
                        'Book',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//ffa301
