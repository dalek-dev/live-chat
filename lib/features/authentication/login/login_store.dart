
import 'package:chat_realtime/features/authentication/login/infraestructure/models/response/login_response.dart' as user;
import 'package:chat_realtime/features/messages/infraestructure/models/users_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginStore {
  late String? token;
  late user.Usuario? currentUser;
  late Usuario usuario;

}