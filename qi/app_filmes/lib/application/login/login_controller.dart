import 'package:aap_filmes/application/services/login/login_service.dart';
import 'package:aap_filmes/application/ui/loader/loader_mixin.dart';
import 'package:aap_filmes/application/ui/messages/messages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessgesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  LoginController({required LoginService loginService}) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    LoaderListener(loading);
    messagesListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessageModel.info(title: 'Info', message: 'Menssagem de info'));
    } on Exception catch (e,s) {
      print(e);
      print(s);
      message(MessageModel.error(title: 'Erro', message: 'Menssagem de erro'));
   }
  }
 
}
