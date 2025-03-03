import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/model.dart';
import '../function/function.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Criando variavel de definição
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _passoword = new TextEditingController();
  String ? _sexo;

  // variaveis para os estados
  String dropdownValue = 'SP';
  var items = ['AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO'];

  //criando titulo da home page
  _tituloHomePage(){
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text('Preencha o cadastro :',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),)
      ),
    );
  }

  //criando formulario
  _rowForm(BuildContext){
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: _formUI(context),
    );
  }

  //criando layout do formulario
  _formUI(BuildContext context){
    return Column(
      children: [
        //preencher o nome
        _rowName(),
        //preecher o email
        _rowEmail(),
        //preencher o passoword
        _rowPassoword(),
        //selecionar sexo
        _rowSexo(),
        //selecionar estado
        _rowTituloEstado(),
      ],
    );
  }

  //layout sexo
  _rowSexo(){
    return Column(
         children: [
           Text('Selecione seu sexo :',
             style: TextStyle(
                fontSize: 20
              ),
            ),
           _escolherSexo('Masculino'),
           _escolherSexo('Feminino'),
         ]
    );
  }

  //criando textfield nome
  _rowName(){
    return TextFormField(
      controller: _nome,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          hintText: 'Digite seu nome',
          icon: Icon(Icons.person)),
      maxLength: 50,
      validator: (value){
        if(value!.isEmpty){
          return 'Digite um valor valido!';
        }
        return null;
      },
    );
  }

  //criando textfield email
  _rowEmail(){
    return TextFormField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          hintText: 'Digite seu Email',
          icon: Icon(Icons.email)),
      maxLength: 50,
      validator: (value){
        if(value!.isEmpty){
          return 'Digite um valor valido!';
        }
        return null;
      },
    );
  }

  //criando textfield passoword
  _rowPassoword(){
    return TextFormField(
      controller: _passoword,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'Digite seu Email ( com 8 digitos )',
          icon: Icon(Icons.password)),
      maxLength: 8,
      validator: (value){
        if(value!.isEmpty){
          return 'Digite um valor valido!';
        }
        return null;
      },
    );
  }

  //criando layout estado
  _rowTituloEstado(){
    return Column(
      children: [
        Text('Selecione seu estado :',
          style: TextStyle(
              fontSize: 20
          ),
        ),
        _rowEstado()
      ],
    );
  }

  //criando dropdownbutton de estado
  _rowEstado(){
    return DropdownButton(
      hint: Text('Selecione o estado'),
      icon: Icon(Icons.map),
      items: items.map((String items) {
        return DropdownMenuItem(value: items, child: Text(items));
      }).toList(),
      dropdownColor: Colors.amber,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold
      ),
      isExpanded: false,
      underline: Container(height: 2, color: Colors.yellow,),
      value: dropdownValue,
      onChanged: (String? newValue){
        setState(() {
          this.dropdownValue = newValue!;
        });
      },
    );
  }

  //criando radiolist sexo
  _escolherSexo(s) {
    return RadioListTile(
      title: Text(s,
      style: TextStyle(
        fontSize: 15
        ),
      ),
      value: '${s}',
      groupValue: _sexo,
      onChanged: (String ?valor) {
        setState(() {
          _sexo = valor!;
        });
      },
    );
  }

  //criando botao home page
  _botaoHomePage(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
      child: ElevatedButton(
          onPressed: (){
            _validacao(context);
          },
          child: Text('Salvar Dados')
      ),
    );
  }

  //criando validacao do cadastro
  _validacao(BuildContext context){
    print('salvar: ${_formKey.currentState!.validate()}');
    if(_formKey.currentState!.validate() && _passoword.text.length == 8 && _sexo!.isNotEmpty){
      print('Seu nome é: ${_nome.text.toString()}');
      print('Seu email é: ${_email.text.toString()}');
      print('Seu sexo é: ${_sexo.toString()}');
      print('Seu estado é: $dropdownValue');

      final person = Person(_nome.text,_email.text,_sexo.toString(),dropdownValue);
      print('Resultado: ${person.toString()}');
      sendSnackBar(context,person.toString());
      Navigator.pushNamed(context, "/lista");

    }else{
      if(_passoword.text.length < 8){
        _mensagemComfirmacao('Digite a senha com 8 digitos!');
      }else if(_sexo!.isEmpty){
        _mensagemComfirmacao('Selecione seu sexo!');
      }else{
        _mensagemComfirmacao('Digite os valores Corretamente!');
      }
    }
  }

  //criando mensagem de confirmação
  void _mensagemComfirmacao(texto){
    showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            title: Center(
                child: Text('Aviso')
            ),
            content: Text(texto),
            contentPadding: EdgeInsets.all(30.0),
            contentTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w500
            ),
          titlePadding: EdgeInsets.all(30.0),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartões Pokemon'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          _tituloHomePage(),
          _rowForm(context),
          _botaoHomePage()
        ],
      ),
    );
  }
}