import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';

import 'kabupaten_bloc.dart';

class ListKabupatenPage extends StatefulWidget {
  int idProvinsi;
  ListKabupatenPage(this.idProvinsi);

  @override
  _ListKabupatenPageState createState() => _ListKabupatenPageState();
}

class _ListKabupatenPageState extends State<ListKabupatenPage> {

  GraphQlConfig _config = GraphQlConfig();
  List<dynamic> _listKabupaten;
  var bloc = KabupatenBloc();

  @override
  void initState() {
    _listKabupaten = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAllKabupaten();
    });
    super.initState();
  }

  void _loadAllKabupaten() async {
    bloc.sink.add(Status.loading);
    GraphQLClient _client = _config.clientToQuery();
    try {
      var queryResult = await _client.query(
          QueryOptions(
              documentNode: gql(getKabupaten(widget.idProvinsi))
          )
      );
      _listKabupaten.clear();
      _listKabupaten.addAll(queryResult.data['kabupaten']);
      bloc.sink.add(Status.success);
    } catch (error) {
      bloc.sink.add(Status.failure);
      debugPrint('$error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: cDarkGreen
        ),
        title: Text("Pilih Kabupaten",
          style: TextStyle(
              color: cDarkGreen
          ),),
        backgroundColor: Colors.white,
        elevation: 3,
      ),
        body: StreamBuilder(
          stream: bloc.stream,
          initialData: Status.loading,
          builder: (BuildContext context, AsyncSnapshot<Status> snapshot) {
            var status = snapshot.data;
            if (status == Status.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (status == Status.failure) {
              return Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gagal memuat data'),
                    RaisedButton(
                      child: Text('ulangi'),
                      onPressed: (){
                        _loadAllKabupaten();
                      },
                    )
                  ],
                ),
              );
            } else if (status == Status.success) {
              return ListView.builder(
                  itemCount: _listKabupaten.length,
                  itemBuilder: (context, index) {
                    var item = _listKabupaten[index];
                    int idKab = item['id'];
                    return ListTileLocation(
                      location: '${item['namaKabupaten']}',
                      onTap: (){
                        Navigator.of(context).pushNamed(RouterGenerator.routeKecamatan, arguments: idKab);
                      },
                    );
                  });
            } else {
              print('nyasar');
              return GestureDetector(
                child: Text('ulangi'),
                onTap: _loadAllKabupaten,
              );
            }
          },
        )
    );
  }
}
