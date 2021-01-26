import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:image/image.dart' as Im;
import 'package:bobshare/models/user.dart';
import 'package:bobshare/widgets/progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class Upload extends StatefulWidget {
  final User currentUser;


  Upload({this.currentUser});

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload>
    with AutomaticKeepAliveClientMixin<Upload> {
  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool isUploading = false;
  String postId = Uuid().v4();
  File _file;

  selectImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.all(10.0),
            title: Text("Create Post"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("From Camera"),
                onPressed: getImageFromCamera,
              ),
              SimpleDialogOption(
                child: Text("From Gallary"),
                onPressed: getImage,
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  Future getImageFromCamera() async {
    Navigator.pop(context);
    try {
      File image = await ImagePicker.pickImage(
        imageQuality: 90,
        source: ImageSource.camera,
      );
      debugPrint('Image size : ${image.lengthSync()}');

      setState(() {
        _file = image;
      });
    } catch (e) {
      debugPrint('image-picker-error ${e.toString()}');
    }
  }

  Future getImage() async {

    try {
      File image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      debugPrint('Image size : ${image.lengthSync()}');

      setState(() {
        _file = image;
      });
    } catch (e) {
      debugPrint('image-picker-error ${e.toString()}');
    }
    Navigator.pop(context);
  }

  Container buildSpalshScreen() {
    return Container(
      color: Theme.of(context).accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/upload.svg',
            height: 260.0,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: selectImage,
              child: Text(
                "Upload Image",
                style: TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 22.0,
                ),
              ),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  // compressImage() async {
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //   Image imageFile = Im.decodeImage(_file.readAsBytesSync());
  //   final compressedImageFile = File('$path/img_$postId.jpg')
  //     ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
  //   setState(() {
  //     _file = compressedImageFile;
  //   });
  // }

  Future<String> uploadImage(imageFile) async {
    StorageUploadTask uploadTask =
    storageRef.child("post_$postId.jpg").putFile(imageFile);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore(
      {String mediaUrl, String location, String description}) {
    postsRef
        .document(widget.currentUser.userId)
        .collection("userPosts")
        .document(postId)
        .setData({
      "postId": postId,
      "ownerId": widget.currentUser.userId,
      "username": widget.currentUser.displayName,
      "mediaUrl": mediaUrl,
      "description": description,
      "location": location,
      "timestamp":timestamp,
      "likes": {},
    });
  }

  clearImage() {
    setState(() {
      _file = null;
    });
  }

  handlePost() async {
    setState(() {
      isUploading = true;
    });
    // await compressImage();
    String mediaUrl = await uploadImage(_file);
    createPostInFirestore(
      mediaUrl: mediaUrl,
      location: locationController.text,
      description: captionController.text,
    );
    captionController.clear();
    locationController.clear();
    setState(() {
      _file = null;
      isUploading = false;
      postId = Uuid().v4();
    });
  }

  buildPostContent() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Caption Post",
          style: TextStyle(fontSize: 22.0, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: clearImage,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed:
                isUploading ? () => print("pressed") : () => handlePost(),
            child: Text(
              "Post",
              style: TextStyle(
                fontSize: 24.0,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          isUploading ? linearProgress(context) : Text(""),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 220,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: FileImage(_file),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(widget.currentUser.photoUrl),
            ),
            title: Container(
              width: 265,
              child: TextField(
                controller: captionController,
                decoration: InputDecoration(
                    hintText: "write a caption ...", border: InputBorder.none),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.pin_drop,
              size: 35,
              color: Colors.orange,
            ),
            title: Container(
              width: 265,
              child: TextField(
                controller: locationController,
                decoration: InputDecoration(
                    hintText: "where was this photo taken?",
                    border: InputBorder.none),
              ),
            ),
          ),
          Divider(),
          Container(
            width: 250.0,
            height: 100,
            alignment: Alignment.center,
            child: RaisedButton.icon(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              onPressed: getUserLocation,
              icon: Icon(
                Icons.my_location,
                color: Colors.white,
              ),
              label: Text(
                "use current location",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  getUserLocation() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    Position position = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).catchError((e){
      print(e);
    });
    List<Placemark> placemarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    String completeAddress =
        '${placemark.subThoroughfare} ${placemark.thoroughfare}, ${placemark.subLocality} ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
    print(completeAddress);
    String formattedAddress = "${placemark.locality}, ${placemark.country}";
    setState(() {
         locationController.text=formattedAddress;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    super.build(context);

    return _file == null ? buildSpalshScreen() : buildPostContent();
  }

}
