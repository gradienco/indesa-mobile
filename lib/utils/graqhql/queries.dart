import 'package:graphql_flutter/graphql_flutter.dart';

///
/// untuk pilih lokasi
///

String getProvinsi() {
  return ("""{
  provinsi{
    id
    namaProvinsi
  }
}""");
}

String getKabupaten(int idProvinsi) {
  return ("""{
  kabupaten(provinsiId:$idProvinsi) {
    id
    namaKabupaten
  }
}""");
}

String getKecamatan(int idKabupaten) {
  return ("""{
  kecamatan(kabupatenId:$idKabupaten) {
    id
    namaKecamatan
  }
}""");
}

String getDesa(int idKecamatan) {
  return ("""{
  desa(kecamatanId:$idKecamatan) {
    id
    namaDesa
  }
}""");
}

QueryOptions getSurvey() {
  var query = """
  {
  survey{
    id
    waktu
    tipe
    poinIdm
    poinIs
    poinIek
    poinIl
    desa{
      namaDesa
    }
  }
}
""";
  return QueryOptions(documentNode: gql(query));
}
