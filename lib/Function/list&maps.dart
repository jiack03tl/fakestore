void main(){
  // var mapA = {
  //   "name":"jack",
  //   "email":"jaipanchal@gmail.com",
  //   "password":"jaipass",
  // };
var listB= {
  "name":"jack",
  "age":"24",
  "name":"jack@fmil.com",
  "name":"jack",
};

  var mapA = Map();
  mapA["name"]="jack";
  mapA["email"]="jai@gmail.com";
  mapA["pass"]="jaypass";
  mapA.forEach((key,value){
    // print(value);
  });

  var mapList = mapA.entries.map((e){
    return e;
  }).toList();
print(mapList[0]);
        // or
 mylist()=> mapA.entries.map<person>((e)=>person.fromjson(e.key)).toList();
 print(mylist());

}
class person{
  String? name;
  String? email;
  String? pass;

person.fromjson(Map<String, dynamic>json){
name = json["name"];
email = json["email"];
pass = json["pass"];
}
}