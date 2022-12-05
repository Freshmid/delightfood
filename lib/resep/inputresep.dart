import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/foundation.dart';
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
  final titlecontroller = TextEditingController();
  final desccontroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  String _base64 = "";
  String format_file = "";

  _getFromGallery() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
    });
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
    CoolAlert.show(
    context: context,
    backgroundColor: Color(0xFFff9934),
    type: CoolAlertType.loading,
    title: 'Loading',
    text: "Sedang Mengupload Resep");
    print("----Uploading Recipe----");
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
          "gambar": _base64,
          "format": format_file,
        }));
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)["status"] == true) {
        await prefs.setInt('user_id', jsonDecode(response.body)["data"]["id"]);
        CoolAlert.show(
        context: context,
        backgroundColor: Color(0xFFff9934),
        type: CoolAlertType.success,
        title: 'Berhasil',
        text: "Resep Berhasil Ditambahkan!",
        confirmBtnText: 'Oke', confirmBtnColor: Color(0xFFff9934));
        print("----Complete----");
      } else {
        CoolAlert.show(
        context: context,
        backgroundColor: Color(0xFFff9934),
        type: CoolAlertType.error,
        title: 'Gagal',
        text: "Resep Gagal Ditambahkan!",
        confirmBtnText: 'Oke', confirmBtnColor: Color(0xFFff9934));
      }
    }
  }

void _pickImageBase64() async{
    try {
       // pick image from gallery, change ImageSource.camera if you want to capture image from camera.
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;  
       // read picked image byte data.
      Uint8List imagebytes = await image!.readAsBytes();
      // using base64 encoder convert image into base64 string.
      String _base64String = base64.encode(imagebytes);
      // print(_base64String);
      
      final imageTemp = File(image.path);
      setState(() {
        _imageFile = imageTemp;
        _base64 = _base64String;   // setState to image the UI and show picked image on screen.
      });
      final get_format = _imageFile.toString();
      print(get_format);
      final split1 = get_format.split('/');
      final split2 = split1[split1.length-1];
      final split3 = split2.split("'");
      
      setState(() {
        format_file = split3[0];
      });
      print(format_file);
    }on PlatformException catch (e){
      if (kDebugMode) {
        print('error');
      }
    }
  }



  Widget inputImage() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          // ImagePicker() != Null?Image.file(File(ImagePicker)):
          Container( 
            child: Text("No Image selected."),
          ),

          //open button ----------------
          ElevatedButton(
            onPressed: (){
                // _getFromGallery();
                _pickImageBase64();
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