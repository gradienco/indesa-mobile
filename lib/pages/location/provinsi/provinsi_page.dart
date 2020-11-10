import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';

import 'provinsi_bloc.dart';

class ListProvinsiPage extends StatefulWidget {
  @override
  _ListProvinsiPageState createState() => _ListProvinsiPageState();
}

class _ListProvinsiPageState extends State<ListProvinsiPage> {

  GraphQlConfig _config = GraphQlConfig();
  List<dynamic> _listProvinsi;
  var bloc = ProvinsiBloc();

  void _loadAllProvinsi() async {
    bloc.sink.add(Status.loading);
    GraphQLClient _client = _config.clientToQuery();
    try {
      var queryResult = await _client.query(
        QueryOptions(
          documentNode: gql(getProvinsi())
        )
      );
      _listProvinsi.clear();
      _listProvinsi.addAll(queryResult.data['provinsi']);
      bloc.sink.add(Status.success);
    } catch (error) {
      bloc.sink.add(Status.failure);
      debugPrint('$error');
    }
  }

  @override
  void initState() {
    _listProvinsi = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAllProvinsi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: cDarkGreen
        ),
        title: Text("Pilih Provinsi",
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
                      _loadAllProvinsi();
                    },
                  )
                ],
              ),
            );
          } else if (status == Status.success) {
            return ListView.builder(
              itemCount: _listProvinsi.length,
              itemBuilder: (context, index) {
                var item = _listProvinsi[index];
                int idProv = item['id'];
                return ListTileLocation(
                  location: '${item['namaProvinsi']}',
                  onTap: (){
                    Navigator.of(context).pushNamed(RouterGenerator.routeKabupaten, arguments: idProv);
                  },
                );
              });
          } else {
            return Container();
          }
        },
      )
    );
  }
}
