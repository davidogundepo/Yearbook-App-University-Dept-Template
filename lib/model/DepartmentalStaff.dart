class DepartmentalStaff {

  String autoBio;
  String staffPosition;
  String qualification;
  String courseTeaching;
  String yearOfInception;
  String email;
  String facebook;
  String linkedIn;
  String id;
  String image;
  String instagram;
  String name;
  String hobbies;
  String phone;
  String philosophy;
  String stateOfOrigin;
  String twitter;

  DepartmentalStaff.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    autoBio = data['autobio'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    hobbies = data['hobbies'];
    phone = data['phone'];
    philosophy = data['philosophy'];
    stateOfOrigin = data['state_of_origin'];
    twitter = data['twitter'];
    staffPosition = data['staff_position'];
    qualification = data['qualification'];
    courseTeaching = data['course_teaching'];
    yearOfInception = data['year_of_inception'];
    linkedIn = data['linkedIn'];
  }

}