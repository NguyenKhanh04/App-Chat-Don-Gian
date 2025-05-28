import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false; // Trạng thái chế độ tối
  bool _isNotificationsEnabled = true; // Trạng thái thông báo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: const Text('Hồ sơ'),
              onTap: () {
                // Chưa xử lý logic hồ sơ
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chức năng chưa khả dụng')),
                );
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.lock, color: Colors.teal),
              title: const Text('Thay đổi mật khẩu'),
              onTap: () {
                // Chưa xử lý logic thay đổi mật khẩu
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chức năng chưa khả dụng')),
                );
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SwitchListTile(
              title: const Text('Chế độ tối'),
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                  // Thông báo trạng thái (có thể thêm logic đổi theme sau)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _isDarkMode ? 'Đã bật chế độ tối' : 'Đã tắt chế độ tối',
                      ),
                    ),
                  );
                });
              },
              secondary: const Icon(Icons.dark_mode, color: Colors.teal),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SwitchListTile(
              title: const Text('Thông báo'),
              value: _isNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isNotificationsEnabled = value;
                  // Thông báo trạng thái
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _isNotificationsEnabled
                            ? 'Đã bật thông báo'
                            : 'Đã tắt thông báo',
                      ),
                    ),
                  );
                });
              },
              secondary: const Icon(Icons.notifications, color: Colors.teal),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.teal),
              title: const Text('Đăng xuất'),
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
          ),
        ],
      ),
    );
  }
}
