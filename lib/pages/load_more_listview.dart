import 'package:flutter/material.dart';
import 'dart:async';


class LoadMoreListView extends StatefulWidget {

  bool enableLoadMore;
  int count;

  LoadMoreListView({this.enableLoadMore = true, this.count = 15});

  @override
  State<StatefulWidget> createState() {
    return new LoadMoreListViewState();
  }

}

class LoadMoreListViewState extends State<LoadMoreListView> {

  ScrollController _scrollController = new ScrollController();
  bool isRequesting = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ///load more when the listView attached the bottom
        loadMore();
      }
    });
  }

  Future<Null> loadMore() async {
    if (isRequesting) {
      ///if is requesting ,return the next action

      return null;
    }
    setState(() {
      widget.count+=10;
      isRequesting = true;
    });

    ///loading your data from any where,eg:network
    return null;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: _count(),
        itemBuilder: _buildItem);
  }

  _count() {
    if (widget.enableLoadMore) {
      return widget.count + 1;
    }
    return widget.count;
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == widget.count) {
      return _buildLoadMoreView();
    }
    return new Container(
      height: 36.0,
      child: new Center(
        child: new Text("I am the $index item"),
      ),
    );
  }

  Widget _buildLoadMoreView() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

}