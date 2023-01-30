const String apiConstant = "https://reqres.in/api";

//api endPoints
const String usersUrl = "$apiConstant/users?page=2";
const String postUrl = "$apiConstant/users%20post%20route";

// http request Status-Codes
const int postSuccessCode = 201;
const int getSuccessCode = 200;
const int invalidResponse = 100;
const int noInternet = 101;
const int invalidFormat = 102;
const int unknownError = 103;
