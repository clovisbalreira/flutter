class Person{
  String? nome;
  String? email;
  String? password;
  String? sexo;
  String? estado;

  Person(this.nome, this.email, this.sexo, this.estado);

  String toString() {
    return '\nNome: $nome\nE-mail: $email\nSexo: $sexo\nEstado: $estado';
  }
}