import 'package:flutter/material.dart';

class PlainPage extends StatefulWidget {
  final String header;
  final String subHeader;
  final Widget child;

  PlainPage({this.header = "Header", this.subHeader = "SubHeader", this.child});

  @override
  _PlainPageState createState() => _PlainPageState();
}

class _PlainPageState extends State<PlainPage> {
  final ScrollController controller = ScrollController();
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Stack 2 layer
        child: Stack(
          children: <Widget>[
            // Layer 1: Header Normal + Content
            SingleChildScrollView(
              controller: controller,
              child: Column(
                children: <Widget>[createHeader(), widget.child ?? Container()],
              ),
            ),
            // Layer 2: Header kecil
            createCompactHeader()
          ],
        ),
      ),
    );
  }

  Widget createCompactHeader() {
    return AnimatedOpacity(
      opacity: (isVisible) ? 1 : 0,
      duration: Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(3, 3),
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(Icons.arrow_back),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.header,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        width: double.infinity,
        height: 40,
      ),
    );
  }

  Widget createHeader() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(Icons.arrow_back),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.header,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                widget.subHeader,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onScroll() {
    final currentScroll = controller.position.pixels;
    // Kalau posisi scroll udah melebihi dari 30
    if (currentScroll > 30) {
      // Tampilkan header kecil kalau masih belum muncul
      // (untuk menghindari refresh berulang)
      if (isVisible == false)
        setState(() {
          isVisible = true;
        });
    }
    // Kalau posisi masih di bawah atau 30
    else {
      // Hilangkan header kecil kalau belum hilang
      // (untuk menghindari refresh berulang)
      if (isVisible == true)
        setState(() {
          isVisible = false;
        });
    }
  }
}
