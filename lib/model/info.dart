//model class
class Note {
  int? id;
  String? name;
  String? matric_id;
  String? phone;
  String? email;
  String? location;

  //constructor
  Note({
    this.id,
    this.name,
    this.matric_id,
    this.phone,
    this.email,
    this.location
  });


  //for saving data to db
  //name must be same as table name in db
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'matric_id': matric_id,
      'phone': phone,
      'email': email,
      'location': location,

    };
  }

  //for retrieving data from db
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      name: map['name'],
      matric_id: map['matric_id'],
      phone: map['phone'],
      email: map['email'],
      location: map['location'],

    );
  }
}