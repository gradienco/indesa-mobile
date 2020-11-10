import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';

import 'kecamatan_bloc.dart';

class ListKecamatanPage extends StatefulWidget {
  int idKabupaten;
  ListKecamatanPage(this.idKabupaten);

  @override
  _ListKecamatanPageState createState() => _ListKecamatanPageState();
}

class _ListKecamatanPageState extends State<ListKecamatanPage> {

  GraphQlConfig _config = GraphQlConfig();
  List<dynamic> _listKecamatan;
  var bloc = KecamatanBloc();

  @override
  void initState() {
    _listKecamatan = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAllKecamatan();
    });
    super.initState();
  }

  void _loadAllKecamatan() async {
    bloc.sink.add(Status.loading);
    GraphQLClient _client = _config.clientToQuery();
    try {
      var queryResult = await _client.query(
          QueryOptions(
              documentNode: gql(getKecamatan(widget.idKabupaten))
          )
      );
      _listKecamatan.clear();
      _listKecamatan.addAll(queryResult.data['kecamatan']);
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
        title: Text("Pilih Kecamatan",
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
                        _loadAllKecamatan();
                      },
                    )
                  ],
                ),
              );
            } else if (status == Status.success) {
              return ListView.builder(
                  itemCount: _listKecamatan.length,
                  itemBuilder: (context, index) {
                    var item = _listKecamatan[index];
                    int idKec = item['id'];
                    return ListTileLocation(
                      location: '${item['namaKecamatan']}',
                      onTap: (){
                        Navigator.of(context).pushNamed(RouterGenerator.routeDesa, arguments: idKec);
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
