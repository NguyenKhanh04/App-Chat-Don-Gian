class ContactManager {
  static List<Map<String, String>> contacts = [
    {'name': 'John', 'phone': '1234567890'},
    {'name': 'Alice', 'phone': '2345678901'},
    {'name': 'Bob', 'phone': '3456789012'},
    {'name': 'Emma', 'phone': '4567890123'},
    {'name': 'David', 'phone': '5678901234'},
    {'name': 'Sophia', 'phone': '6789012345'},
    {'name': 'Michael', 'phone': '7890123456'},
    {'name': 'Olivia', 'phone': '8901234567'},
    {'name': 'James', 'phone': '9012345678'},
    {'name': 'Isabella', 'phone': '0123456789'},
  ];

  static void addContact(String name, String phone) {
    contacts.add({'name': name, 'phone': phone});
  }
}
