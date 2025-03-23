class todomodel{
  final int id;
  final String title;
  final String description;
 

  todomodel({required this.title,required this.description,required this.id});

  factory todomodel.fromjson(Map<String,dynamic>json){
    return todomodel(
      id: json['id'],
  title: json['description'] ?? 'no data',
  description: json['title'] ?? 'no data',

  
    );


  
  }


  Map<String,dynamic>tojson(){
    return {
'id':id,
'title':title,
'description' : description
    };
  }
}