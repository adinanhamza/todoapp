// class todomodel{
//   final String id;
//   final String title;
//   final String description;
 

//   todomodel({required this.title,required this.description,required this.id});

//   factory todomodel.fromjson(Map<String,dynamic>json){
//     return todomodel(
//       id: json['id'],
//   title: json['title'] ?? 'no title',
//   description: json['description'] ?? 'no description',

  
//     );


  
//   }


//   Map<String,dynamic>tojson(){
//     return {
// 'id':id,
// 'title':title,
// 'description' : description
//     };
//   }
// }

class todomodel{
String id;
String title;
String description;

todomodel({required this.description,required this.id,required this.title});

factory todomodel.fromjson(Map<String,dynamic>json){
  return todomodel(
    id: json['id'] ?? 'no id',
    title: json['title'] ?? 'no title',
    description:json['description'] ?? 'no description',
    
     );
}

Map<String,dynamic>tojson(){
  return {
    'id':id,
    'title':title,
    'description': description
  };
}

}