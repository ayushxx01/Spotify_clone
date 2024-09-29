//here we get the data from the user to create a new user

//this is the model class for the user data
class CreateUserReq {
  final String fullName;
  final String email;
  final String password;

//here we are getting the data from the user to create a new user
  CreateUserReq({
    required this.fullName,
    required this.email,
    required this.password,
  });
}
