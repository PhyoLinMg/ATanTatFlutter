
class Data {

  int id;
  String name;
  int year;

	Data.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		name = map["name"],
		year = map["year"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['year'] = year;
		return data;
	}
}
