import 'package:bobshare/mobx/SearchMobx.dart';
import 'package:bobshare/models/user.dart';
import 'package:bobshare/pages/profile.dart';
import 'package:bobshare/widgets/progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();

  Searchcontroller con =Searchcontroller();

  AppBar buildSearchFeild() {
    return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          prefixIcon: Icon(
            Icons.account_circle,
            size: 20.0,
          ),
          filled: true,
          suffixIcon:  IconButton(
            icon: Icon(
              Icons.clear,
              size: 20.0,
            ),
            onPressed: clearField,
          ),
          contentPadding: EdgeInsets.all(8.0),
          hintText: "search for a user ...",
        ),
        onFieldSubmitted:con.handleSearch,
      ),
    );
  }

  void clearField() {
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.clear());
  }

  Container buildNoContent() {
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/search.svg",
              height: 300.0,
            ),
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60.0,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  buildSearchResults() {
    return FutureBuilder(
      future: con.searchResultFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress(context);
        }
        List<UserResult> searchResults = [];
        snapshot.data.documents.forEach((doc) {
          User user =User.fromDocument(doc);
          UserResult searchResult = UserResult(user: user);
          searchResults.add(searchResult);
        });
        return ListView(
          children: searchResults,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          appBar: buildSearchFeild(),
          body: con.searchResultFuture == null ? buildNoContent() : buildSearchResults(),
        );
      }
    );
  }


}

class UserResult extends StatelessWidget {

 final User user ;
  UserResult({this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
//      color: Theme.of(context).primaryColor,
      child: ListView(
        shrinkWrap: false,
        children: <Widget>[
          GestureDetector(
            onTap: ()=>showProfile(context, profileId: user.userId),
            child: ListTile(
               title: Text(user.displayName,style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Colors.tealAccent,
               ),),
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(user.photoUrl),
              ),
               subtitle: Text(user.email,style: TextStyle(
                 color: Colors.tealAccent,
               ),),
            ),
          ),
          Divider(
            height: 5.0,
            color: Colors.teal,
          )
        ],
      ),
    );
  }
}
showProfile(BuildContext context, {String profileId}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Profile(
        profileId:profileId,
      ),
    ),
  );
}

