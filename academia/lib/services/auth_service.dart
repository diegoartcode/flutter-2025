class AuthService {
  static final Map<String, String> _users = {
    'joao': '123',
    'maria': 'abc',
    'diego': 'senha',
  };

  static bool login(String user, String pass) {
    return _users[user] == pass;
  }
}
