import 'dart:developer';

import 'package:demo/bloc/bloc.dart';
import 'package:demo/model/data_model.dart';
import 'package:demo/widget/Data_show_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isClick = false;

  @override
  void initState() {
    super.initState();
    globalBloc.doFetchData();
    //_getData();
  }

  _getData() async {
    var res = await globalBloc.doFetchData();
    log('Response : ${res.data.records}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Record List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<Welcome>(
            stream: globalBloc.getData.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.data.records.isEmpty) {
                return const Center(
                  child: Text("No Data Available"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data.records;
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return DataShowWidget(
                        onTap: () {},
                        onPress: () {},
                        collectionValue: data[index].collectedValue,
                        imageUrl: data[index].mainImageUrl,
                        shortDesc: data[index].shortDescription,
                        title: data[index].title,
                        totalValue: data[index].totalValue,
                        recors: snapshot.data!.data.totalRecords);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
