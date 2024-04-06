import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage();

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double _textScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              _textScaleFactor = 1.0 - notification.metrics.pixels / 300;
              _textScaleFactor = _textScaleFactor.clamp(0.0, 1.0);
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                color: const Color.fromRGBO(85, 124, 85, 1),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.grey,
                        // Your app logo widget goes here
                        child: Image.asset(
                          'assets/images/logo.png', // Replace with your image path
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Trusted',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Latest',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        'BOYCOTT APA',
                        style: TextStyle(
                          fontSize: 24 * _textScaleFactor,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 0),
                    Text(
                      'The Blockchain-Enhanced Chatbot for Distinguishing Brands with Israeli Connections is an innovative project aimed at providing users with accurate and reliable information about the origin and connections of various brands, particularly those associated with Israel. Leveraging the power of blockchain technology and natural language processing (NLP), this chatbot offers a seamless and trustworthy platform for users to inquire about the Israeli affiliations of different products and companies.',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'The Blockchain-Enhanced Chatbot for Distinguishing Brands with Israeli Connections is an innovative project aimed at providing users with accurate and reliable information about the origin and connections of various brands, particularly those associated with Israel. Leveraging the power of blockchain technology and natural language processing (NLP), this chatbot offers a seamless and trustworthy platform for users to inquire about the Israeli affiliations of different products and companies.',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 60),
                    Image.asset(
                          'assets/images/logo.png', // Replace with your image path
                          fit: BoxFit.contain,
                        ),
                    SizedBox(height: 10),
                    Text(
                      'Support Our Cause',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Your generous donation will help us make a difference.',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // Handle donation button 1 action
                          },
                          child: Text(
                            'Donate Now',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(255, 64, 64, 1),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Handle donation button 2 action
                          },
                          child: Text(
                            'Support Us',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(255, 64, 64, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Text(
                      'Affiliations',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                                           ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/aff1.png', 
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Image.asset(
                          'assets/images/aff2.png', 
                          height: 50,
                        ),
                        
                      ],
                    ),
                  SizedBox(width: 1000),
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