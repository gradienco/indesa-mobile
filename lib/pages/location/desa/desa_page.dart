import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';

import 'desa_bloc.dart';

class ListDesaPage extends StatefulWidget {
  int idKecamatan;
  ListDesaPage(this.idKecamatan);

  @override
  _ListDesaPageState createState() => _ListDesaPageState();
}

class _ListDesaPageState extends State<ListDesaPage> {

  GraphQlConfig _config = GraphQlConfig();
  List<dynamic> _listDesa;
  var bloc = DesaBloc();

  @override
  void initState() {
    _listDesa = [];
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
              documentNode: gql(getDesa(widget.idKecamatan))
          )
      );
      _listDesa.clear();
      _listDesa.addAll(queryResult.data['desa']);
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
        title: Text("Pilih Desa",
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
                  itemCount: _listDesa.length,
                  itemBuilder: (context, index) {
                    var item = _listDesa[index];
                    int idDesa = item['id'];
                    return ListTileLocation(
                      location: '${item['namaDesa']}',
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacementNamed(
                            RouterGenerator.routeSurvey,
                            arguments: idDesa
                        );
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
