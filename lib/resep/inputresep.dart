import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InputResep extends StatefulWidget {
  const InputResep({ Key? key }) : super(key: key);

  @override
  _InputResep createState() => _InputResep();
}

class _InputResep extends State<InputResep> {
  // late File _image;
  // final ImagePicker picker = ImagePicker();
  // TextEditingController nameController = TextEditingController();


  // Future choiceImage()async{
  //   var pickedImage = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(pickedImage!.path);
  //   });
  //   Uint8List imagebytes = await _image.readAsBytes(); //convert to bytes
  //   String base64string = base64.encode(imagebytes); //convert bytes to base64 string
  //   print(base64string); 
  // }
  final titlecontroller = TextEditingController();
  final desccontroller = TextEditingController();
  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";
  
  openImage() async {
    try {
        var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
        //you can use ImageCourse.camera for Camera capture
        if(pickedFile != null){
          setState(() {
            imagepath = pickedFile.path;
          });
          print(imagepath); 
          //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg

          File imagefile = File(imagepath); //convert Path to File
          Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
          String base64string = base64.encode(imagebytes); //convert bytes to base64 string
          print(base64string); 

          Uint8List decodedbytes = base64.decode(base64string);
          //decode base64 stirng to bytes  
        }else{
           print("No image is selected.");
        }
    }catch (e) {
        print("error while picking file.");
    }
  }

  @override
  void dispose() {
    titlecontroller.dispose();
    desccontroller.dispose();
    super.dispose();
  }

  // void getUser() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final response = await http.get(Uri.parse(
  //       "http://delight.foundid.my.id/api/user?id=${prefs.getInt('user_id')}"));
  //   // tanggallahircontroller.text = jsonDecode(response.body)["data"]["tanggal_lahir"];
  //   // image = jsonDecode(response.body)["data"]["gambar"];
  //   setState(() {});
  // }

  void fetchRecipe() async {
    final prefs = await SharedPreferences.getInstance();
    final get_id = prefs.getInt('user_id');
    print("----Sending Request----");
    print(get_id.toString());
    final response = await http.post(
      // Uri.parse("${dotenv.get('API_URL')}/register"),
        Uri.parse('http://delight.foundid.my.id/api/up-resep'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "user_id": get_id.toString(),
          "nama": titlecontroller.text,
          "deskripsi": desccontroller.text,
        }));
    print("----Uploading Recipe----");
    if (response.statusCode == 200) {
      print("----Complete----");
    }
  }



  Widget inputImage() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          imagepath != ""?Image.file(File(imagepath)):
            Container( 
              child: Text("No Image selected."),
            ),

            //open button ----------------
            ElevatedButton(
              onPressed: (){
                  openImage();
              }, 
              child: Text("Open Image")
            ),
        ]
      ),
    );
  }

  Widget inputName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nama Resep",
          style: TextStyle(
              fontSize: 16,
              color: Color(0xFFE7872C),
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: titlecontroller,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.receipt,
                    color: Color(0xFFE7872C)
                ),
                hintText: 'Nama resep',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  Widget inputDeskripsi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deskripsi Makanan",
          style: TextStyle(
              fontSize: 16,
              color: Color(0xFFE7872C),
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: desccontroller,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.description,
                    color: Color(0xFFE7872C)
                ),
                hintText: 'Deskripsi makanan',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  Widget inputAlat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alat dan Bahan yang Diperlukan",
          style: TextStyle(
              fontSize: 16,
              color: Color(0xFFE7872C),
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.toc,
                    color: Color(0xFFE7872C)
                ),
                hintText: 'Alat dan bahan',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  Widget inputCara() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Langkah-Langkah Memasak",
          style: TextStyle(
              fontSize: 16,
              color: Color(0xFFE7872C),
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.toc,
                    color: Color(0xFFE7872C)
                ),
                hintText: 'Langkah-langkah',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  Widget saveButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
          style: TextButton.styleFrom(
              elevation: 5,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              backgroundColor: Color(0xFFE7872C)
          ),
          onPressed: () {
            fetchRecipe();
          },
          child: Text(
            "SIMPAN",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 120
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.receipt,
                              color: Colors.black38,
                              size: 100
                          ),
                          Text(
                              'Tambah Resep Baru',
                              style: TextStyle(
                                  color: Color(0xFFE7872C),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          SizedBox(height: 50),
                          inputImage(),
                          SizedBox(height: 20),
                          inputName(),
                          SizedBox(height: 20),
                          inputDeskripsi(),
                          // SizedBox(height: 20),
                          // inputAlat(),
                          // SizedBox(height: 20),
                          // inputCara(),
                          SizedBox(height: 20),
                          saveButton()
                        ],
                      ),
                    ),
                  )
                ]
            ),
          ),
        )
    );
  }
}