import 'package:flutter/material.dart'; // Nhập thư viện giao diện Material của Flutter
import 'chat_screen.dart'; // Nhập tệp màn hình chat (giả sử chứa giao diện chat chi tiết)

class ChatListPage extends StatefulWidget { // Định nghĩa màn hình danh sách chat, kế thừa từ StatefulWidget
  @override
  _ChatListPageState createState() => _ChatListPageState(); // Tạo trạng thái của màn hình
}

//Xử lý điều hướng (routes)
//initialRoute: '/login' → Mặc định mở trang đăng nhập.
//Khi người dùng đăng nhập thành công, điều hướng đến /chatlist.
//'/chatlist': (context) => ChatListPage(), giúp hiển thị danh sách trò chuyện.

class _ChatListPageState extends State<ChatListPage> {
  // Danh sách các cuộc trò chuyện, mỗi cuộc trò chuyện là một map chứa thông tin người dùng
  List<Map<String, String>> chats = [
    {
      'name': 'John', // Tên người dùng
      'message': 'Xin chào!', // Tin nhắn gần nhất
      'time': '10:30', // Thời gian tin nhắn gần nhất
      'phone': '0123456789', // Số điện thoại liên hệ
    },
    {
      'name': 'Alice',
      'message': 'Bạn khỏe không?',
      'time': '09:15',
      'phone': '0987654321',
    },
  ];

  // Hàm hiển thị hộp thoại (dialog) để thêm liên hệ mới
  void _showAddContactDialog() {
    String name = ''; // Biến tạm lưu tên nhập vào
    String phone = ''; // Biến tạm lưu số điện thoại nhập vào

    showDialog(
      context: context, // Lấy context của màn hình hiện tại
      builder: (context) => AlertDialog( // Hiển thị hộp thoại (dialog)
        title: const Text('Thêm liên hệ mới'), // Tiêu đề của dialog
        content: Column( // Nội dung của dialog
          mainAxisSize: MainAxisSize.min, // Để cột chỉ chiếm không gian cần thiết
          children: [
            TextField( // Ô nhập tên liên hệ
              decoration: const InputDecoration(labelText: 'Tên'), // Nhãn hiển thị
              onChanged: (value) => name = value, // Cập nhật biến name khi nhập dữ liệu
            ),
            TextField( // Ô nhập số điện thoại
              decoration: const InputDecoration(labelText: 'Số điện thoại'),
              keyboardType: TextInputType.phone, // Chỉ cho phép nhập số điện thoại
              onChanged: (value) => phone = value, // Cập nhật biến phone khi nhập dữ liệu
            ),
          ],
        ),
        actions: [
          TextButton( // Nút "Hủy"
            onPressed: () => Navigator.pop(context), // Đóng hộp thoại khi nhấn
            child: const Text('Hủy'),
          ),
          TextButton( // Nút "Thêm"
            onPressed: () {
              if (name.isNotEmpty && phone.isNotEmpty) { // Kiểm tra nếu dữ liệu hợp lệ
                setState(() { // Cập nhật trạng thái UI
                  chats.add({ // Thêm liên hệ mới vào danh sách chats
                    'name': name,
                    'message': 'Chào bạn!', // Tin nhắn mặc định
                    'time': DateTime.now().toString().substring(11, 16), // Lấy giờ hiện tại
                    'phone': phone,
                  });
                });
                Navigator.pop(context); // Đóng hộp thoại sau khi thêm thành công
              }
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Bố cục chính của màn hình
      appBar: AppBar(
        title: const Text('Danh sách trò chuyện'), // Tiêu đề AppBar
        backgroundColor: Colors.teal, // Màu nền của AppBar
      ),
      body: ListView.builder( // Hiển thị danh sách chat động
        padding: const EdgeInsets.all(8.0), // Khoảng cách lề
        itemCount: chats.length, // Số lượng phần tử trong danh sách
        itemBuilder: (context, index) => Card( // Hiển thị mỗi phần tử trong danh sách dưới dạng Card
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10), // Khoảng cách giữa các phần tử
          child: ListTile( // Hiển thị nội dung cuộc trò chuyện
            leading: CircleAvatar( // Ảnh đại diện (chữ cái đầu của tên)
              backgroundColor: Colors.teal, // Màu nền avatar
              child: Text(
                chats[index]['name']![0], // Lấy ký tự đầu tiên của tên
                style: const TextStyle(color: Colors.white), // Màu chữ trắng
              ),
            ),
            title: Text( // Hiển thị tên người dùng
              chats[index]['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(chats[index]['message']!), // Hiển thị tin nhắn gần nhất
            trailing: Text(chats[index]['time']!), // Hiển thị thời gian tin nhắn
            onTap: () => Navigator.push( // Khi nhấn vào, mở màn hình trò chuyện chi tiết
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  contactName: chats[index]['name']!, // Truyền tên người dùng vào màn hình chat
                  phoneNumber: chats[index]['phone']!, // Truyền số điện thoại vào màn hình chat
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton( // Nút thêm liên hệ mới
        onPressed: _showAddContactDialog, // Gọi hộp thoại thêm liên hệ khi nhấn
        backgroundColor: Colors.teal, // Màu nền nút
        child: const Icon(Icons.person_add), // Biểu tượng nút
      ),
      bottomNavigationBar: BottomNavigationBar( // Thanh điều hướng dưới cùng
        selectedItemColor: Colors.teal, // Màu khi mục được chọn
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'), // Mục Chat
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Danh bạ'), // Mục Danh bạ
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cài đặt'), // Mục Cài đặt
        ],
        onTap: (index) { // Xử lý khi người dùng nhấn vào mục trong thanh điều hướng
          if (index == 1) {
            Navigator.pushNamed(context, '/contacts'); // Chuyển đến màn hình danh bạ
          } else if (index == 2) {
            Navigator.pushNamed(context, '/settings'); // Chuyển đến màn hình cài đặt
          }
        },
      ),
    );
  }
}
