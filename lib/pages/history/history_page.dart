import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';
import 'package:sqflite/sqflite.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Survey",
          style: TextStyle(
              color: cDarkGreen
          ),),
        backgroundColor: Colors.white,
        elevation: 0,
        bottomOpacity: 0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String _token="";
  DatabaseHelper _dbHelper = DatabaseHelper();

  void _getUserData(){
    final Future<Database> dbFuture = _dbHelper.initializeDatabase();
    dbFuture.then((database){
      Future<Map<String, dynamic>> userData = _dbHelper.getUser();
      userData.then((data){
        setState(() {
          _token = data['token'];
        });
      });
    });
  }

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQlConfig.initializeClientAuth(_token),
      child: Query(
        options: getSurvey(),
        builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }){
          if (result.hasException) {
            print('bermasalah : ${result.exception}');
            return Center(child: Text(result.exception.toString(),
            textAlign: TextAlign.center,));
          }
          if (result.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: result.data['survey'].length,
            itemBuilder: (BuildContext context, int index){
              var item = result.data['survey'];
              String _getCategory(double idm){
                if(idm <= 0.491) {
                  return "Sangat Tertinggal";
                }
                if(idm > 0.491 && idm <= 0.599){
                  return "Tertinggal";
                }
                if(idm > 0.599 && idm <= 0.707){
                  return "Berkembang";
                }
                if(idm > 0.707 && idm <= 0.815){
                  return "Maju";
                }
                if(idm > 0.815){
                  return "Mandiri";
                }
              }
              return Center(
                child: ListTileHistory(
                    poinIDM: item[index]['poinIdm'].toStringAsFixed(3),
                    desa: item[index]['desa']['namaDesa'],
                    kategori: _getCategory(item[index]['poinIdm'])
                ),
              );
            }
          );
        },
      ),
    );
  }
}



