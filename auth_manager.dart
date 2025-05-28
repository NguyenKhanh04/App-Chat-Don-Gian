class AuthManager { // Định nghĩa một lớp (class) có chức năng quản lý xác thực người dùng
  static String? registeredEmail; // Biến tĩnh để lưu email đã đăng ký (có thể null nếu chưa đăng ký)
  static String? registeredPassword; // Biến tĩnh để lưu mật khẩu đã đăng ký (có thể null nếu chưa đăng ký)

  // Phương thức đăng ký tài khoản, lưu email và mật khẩu vào biến tĩnh
  static void register(String email, String password) {
    registeredEmail = email; // Gán email được đăng ký vào biến lưu trữ
    registeredPassword = password; // Gán mật khẩu được đăng ký vào biến lưu trữ
  }

  // Phương thức đăng nhập, kiểm tra thông tin đăng nhập có khớp với tài khoản đã đăng ký không
  static bool login(String email, String password) {
    // Kiểm tra nếu chưa có tài khoản đăng ký thì trả về false (đăng nhập thất bại)
    if (registeredEmail == null || registeredPassword == null) {
      return false;
    }
    // Kiểm tra email và mật khẩu nhập vào có trùng khớp với thông tin đã đăng ký không
    return registeredEmail == email && registeredPassword == password;
  }
}
