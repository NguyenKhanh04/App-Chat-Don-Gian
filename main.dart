import 'package:flutter/material.dart'; // Nhập thư viện giao diện Material của Flutter
import 'page/login_page.dart'; // Nhập trang đăng nhập
import 'page/signup_page.dart'; // Nhập trang đăng ký
import 'page/chat_list_page.dart'; // Nhập trang danh sách trò chuyện
import 'page/contacts_page.dart'; // Nhập trang danh bạ
import 'page/settings_page.dart'; // Nhập trang cài đặt
import 'page/add_contact_page.dart'; // Nhập trang thêm liên hệ mới

void main() {
  runApp(ChatApp()); // Chạy ứng dụng với widget gốc là ChatApp
}

class ChatApp extends StatelessWidget { // Định nghĩa lớp ChatApp kế thừa StatelessWidget
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Sử dụng MaterialApp để tạo ứng dụng Flutter
      title: 'Chat App', // Tiêu đề của ứng dụng
      theme: ThemeData( // Cấu hình giao diện toàn ứng dụng
        primarySwatch: Colors.teal, // Màu chủ đạo của ứng dụng
        scaffoldBackgroundColor: Colors.grey[100], // Màu nền chính của ứng dụng

        // Cấu hình theme cho các thẻ (Card)
        cardTheme: CardTheme(
          elevation: 5, // Độ nổi của Card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Bo tròn góc của Card
          ),
        ),

        // Cấu hình theme cho các nút bấm nâng cao (ElevatedButton)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Khoảng cách bên trong nút
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25), // Bo tròn góc của nút
            ),
            backgroundColor: Colors.teal, // Màu nền của nút
            foregroundColor: Colors.white, // Màu chữ của nút
          ),
        ),

        // Cấu hình theme cho các nút dạng văn bản (TextButton)
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.teal), // Màu chữ của nút
        ),

        // Cấu hình theme cho các ô nhập liệu (TextField)
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder( // Viền mặc định của ô nhập
            borderRadius: BorderRadius.circular(15), // Bo tròn viền
            borderSide: const BorderSide(color: Colors.teal), // Màu viền
          ),
          focusedBorder: OutlineInputBorder( // Viền khi ô nhập được chọn
            borderRadius: BorderRadius.circular(15), // Bo tròn viền
            borderSide: const BorderSide(color: Colors.teal, width: 2), // Màu viền và độ dày
          ),
          filled: true, // Kích hoạt màu nền cho ô nhập
          fillColor: Colors.white, // Màu nền của ô nhập
        ),
      ),

      initialRoute: '/login', // Màn hình khởi động mặc định là trang đăng nhập

      // Định nghĩa các route trong ứng dụng
      routes: {
        '/login': (context) => LoginPage(), // Route cho màn hình đăng nhập
        '/signup': (context) => SignupPage(), // Route cho màn hình đăng ký
        '/chatlist': (context) => ChatListPage(), // Route cho màn hình danh sách chat
        '/contacts': (context) => ContactsPage(), // Route cho màn hình danh bạ
        '/settings': (context) => SettingsPage(), // Route cho màn hình cài đặt
        '/add_contact': (context) => AddContactPage(), // Route cho màn hình thêm liên hệ
      },
    );
  }
}
