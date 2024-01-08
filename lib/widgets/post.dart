import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/constant/common_size.dart';
import 'package:flutter_project/widgets/my_progress_indicator.dart';
import 'package:flutter_project/widgets/rounded_avatar.dart';

class Post extends StatelessWidget {
  final int index;
  Size? size; // Nullable로 변경

  Post(
      this.index, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size; // size가 null이면 MediaQuery의 size로 초기화

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader(),
        _postImage(),
        _postActions(),
        Padding(
          padding: const EdgeInsets.only(left: common_gap),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
             Text(
                '120 comments',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width:8.0),
              Text(
                '120 likes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width:8.0),
              Text(
                '400k viewers',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width:8.0),
              Text(
                '20k sharing',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width:8.0),
              ],
          ),
        ),
      ],
    );
  }

  Row _postActions() {
    return Row(
        children: <Widget>[
          IconButton(
            onPressed: null,
            icon: ImageIcon(AssetImage('assets/images/comment.png')),
            color: Colors.black87
          ),
          Spacer(),
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/images/heart_selected.png')),
              color: Colors.black87
          ),
          Spacer(),
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/images/bookmark.png')),
              color: Colors.black87
          ),
          Spacer(),
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/images/direct_message.png')),
              color: Colors.black87
          ),
        ],
      );
  }
  
  Widget _postHeader(){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: RoundedAvatar(),
        ),
        Expanded(child: Text('username')),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
        )
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
        imageUrl: 'https://picsum.photos/id/$index/2000/2000',
        placeholder: (BuildContext context, String url) {
          return MyProgressIndicator(containerSize: size!.width,);
        },
        imageBuilder: (BuildContext context, ImageProvider imageProvider) {
          return AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          );
        },
      );
  }
}

