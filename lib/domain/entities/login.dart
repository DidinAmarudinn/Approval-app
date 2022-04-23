import 'package:equatable/equatable.dart';


class Login extends Equatable{
    Login({
       required this.status,
       required this.data,
    });

    bool status;
    Data data;
 

  @override
  List<Object?> get props => [data];
   
}
class Data {
    Data({
        this.usrid,
        this.uname,
        this.phone,
        this.email,
        this.token,
        this.client,
        this.manifest,
    });

    int? usrid;
    String? uname;
    String? phone;
    String? email;
    String? token;
    Client? client;
    Manifest? manifest; 
}

class Client {
    Client({
        this.code,
        this.name,
        this.logo,
        this.company,
    });

    String? code;
    String? name;
    String? logo;
    List<Company>? company;

   
}

class Company {
    Company({
        this.id,
        this.name,
    });

    int? id;
    String? name;
}

class Manifest {
    Manifest({
        this.version,
        this.appName,
        this.appLogo,
        this.themes,
    });

    String? version;
    String? appName;
    String? appLogo;
    Theming? themes;

    
}

class Theming {
    Theming({
        this.headerColor,
        this.buttonColor,
        this.dialogColor,
    });

    String? headerColor;
    String? buttonColor;
    String? dialogColor;

}
