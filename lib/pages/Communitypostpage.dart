import 'package:flutter/material.dart';

class Communitypostpage extends StatefulWidget {
  @override
  _CommunitypostpageState createState() => _CommunitypostpageState();
}

class _CommunitypostpageState extends State<Communitypostpage> {
  bool isAddQuestion = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.person, color: Colors.black),
                SizedBox(width: 5),
                Text("Shruthi", style: TextStyle(color: Colors.black)),
              ],
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe96443), Color(0xFFf7f7f7)], // closer to the orange-red gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bodhi",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isAddQuestion = true;
                      });
                    },
                    child: Text(
                      "Add Question",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: isAddQuestion
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isAddQuestion = false;
                      });
                    },
                    child: Text(
                      "Create Post",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: !isAddQuestion
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              isAddQuestion ? _buildAddQuestion() : _buildCreatePost(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("State Your Question"),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
            ],
          ),
          child: TextField(
            maxLines: 6,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: "Start typing here...",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Post"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFe74c3c),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreatePost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Photo"),
        SizedBox(height: 10),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey.shade100,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Upload image logic
                  },
                  child: Text("Upload from device"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text("Add Comments"),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
            ],
          ),
          child: TextField(
            maxLines: 4,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: "Start typing here...",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Post"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFe74c3c),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}
