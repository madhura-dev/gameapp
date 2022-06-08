class Data{
  late String name;
  late String value;
  late String imgurl;
  late bool accepting = false;

  Data({required this.name,required this.imgurl,required this.value,
    required this.accepting
  });

  Data.fromJson(Map<String , dynamic> json){
    name = json['name'];
    value = json['value'];
    imgurl = json['imgurl'];
    accepting = false;
  }

  Map<String , dynamic> toJson(){
    final Map<String , dynamic> data = new Map<String , dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['imgurl'] = this.imgurl;
    return data;
  }

}