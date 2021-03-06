import 'package:flutter/material.dart';
import 'package:http_request/screen/gallery_screen.dart';

class Page {
  final String title;
  final Icon icon;
  final String label;
  final Widget page;

  Page({this.title, this.icon, this.label, this.page});
}

List<Page> pages = [
  Page(
    icon: Icon(Icons.home),
    label: "photo",
    page: GalleryScreen(),
    title: "รูปภาพ",
  ),
];
