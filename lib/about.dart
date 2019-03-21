import 'dart:ui' as ui;

import 'home.dart';
import 'model.dart';

import 'videocard.dart';

import 'package:flutter/material.dart';

class About extends StatelessWidget {
  About(this.dev);

  final DEV dev;

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildInfo(),
          _buildVideoScroller(),
          _buildbuton(context),
        ],
      ),
    );
  }

  Widget _buildbuton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            'Back',
            style: TextStyle(color: Colors.white70),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          },
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 110.0,
      height: 110.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white30),
      ),
      margin: const EdgeInsets.only(top: 32.0, left: 16.0),
      padding: const EdgeInsets.all(3.0),
      child: ClipOval(
        child: Image.asset(dev.avatar),
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            dev.firstName + dev.lastName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Text('\n'),
          Text(
            dev.location,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 225.0,
            height: 1.0,
          ),
          Text(
            dev.biography,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoScroller() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(245.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemCount: dev.videos.length,
          itemBuilder: (BuildContext context, int index) {
            var video = dev.videos[index];

            return VideoCard(video);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 50.0,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          Image.asset(dev.backdropPhoto, fit: BoxFit.cover),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: _buildContent(context),
            ),
          ),
        ],
      ),
    );
  }
}
