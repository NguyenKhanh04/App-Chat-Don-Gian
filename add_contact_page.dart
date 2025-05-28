import 'package:flutter/material.dart'; // Nhập thư viện Flutter Material để xây dựng giao diện
import 'contact_manager.dart'; // Nhập tệp quản lý danh bạ (giả sử chứa hàm addContact)

class AddContactPage extends StatelessWidget { // Tạo một màn hình thêm liên hệ, kế thừa từ StatelessWidget
  // Khai báo hai bộ điều khiển để quản lý văn bản nhập vào ô tên và số điện thoại
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Hàm xử lý khi người dùng nhấn nút "Thêm"
  void _handleAddContact(BuildContext context) {
    String name = _nameController.text.trim(); // Lấy giá trị từ ô nhập "Tên" và loại bỏ khoảng trắng thừa
    String phone = _phoneController.text.trim(); // Lấy giá trị từ ô nhập "Số điện thoại"

    // Kiểm tra nếu người dùng chưa nhập đủ thông tin
    if (name.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin')), // Hiển thị thông báo lỗi
      );
      return; // Dừng hàm nếu thông tin bị thiếu
    }

    ContactManager.addContact(name, phone); // Gọi hàm thêm liên hệ từ ContactManager
    Navigator.pop(context); // Đóng màn hình hiện tại và quay về trang trước
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã thêm liên hệ thành công')) // Hiển thị thông báo thành công
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold là bố cục chính của trang
      appBar: AppBar(
        title: const Text('Thêm liên hệ'), // Tiêu đề trên thanh AppBar
        backgroundColor: Colors.teal, // Đặt màu nền cho AppBar
      ),
      body: Padding( // Thêm khoảng cách xung quanh nội dung trang
        padding: const EdgeInsets.all(24.0),
        child: Column( // Sắp xếp các thành phần theo chiều dọc
          children: [
            TextField( // Ô nhập tên liên hệ
              controller: _nameController, // Liên kết bộ điều khiển với ô nhập
              decoration: const InputDecoration(
                labelText: 'Tên', // Nhãn hiển thị trong ô nhập liệu
                prefixIcon: Icon(Icons.person, color: Colors.teal), // Biểu tượng người dùng
              ),
            ),
            const SizedBox(height: 16), // Khoảng cách giữa các ô nhập

            TextField( // Ô nhập số điện thoại
              controller: _phoneController, // Liên kết bộ điều khiển với ô nhập
              decoration: const InputDecoration(
                labelText: 'Số điện thoại', // Nhãn hiển thị
                prefixIcon: Icon(Icons.phone, color: Colors.teal), // Biểu tượng điện thoại
              ),
              keyboardType: TextInputType.phone, // Định dạng bàn phím chỉ nhập số điện thoại
            ),
            const SizedBox(height: 24), // Thêm khoảng cách trước nút bấm

            ElevatedButton( // Nút bấm "Thêm"
              onPressed: () => _handleAddContact(context), // Gọi hàm xử lý khi nhấn
              child: const Text('Thêm'), // Nội dung hiển thị trên nút
            ),
          ],
        ),
      ),
    );
  }
}
