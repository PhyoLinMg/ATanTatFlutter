import 'package:atantat_flutter/model/major.dart';

class Majors {

  List<Data> data;

	Majors.fromJsonMap(Map<String, dynamic> map): 
		data = List<Data>.from(map["data"].map((it) => Data.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['data'] = data != null ? 
			this.data.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
