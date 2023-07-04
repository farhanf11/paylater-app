class User {
  final String name;
  final String akses;
  final String email;
  final String phonenumber;

  User(
    this.name,
    this.akses,
    this.email,
    this.phonenumber,
  );
}

List admin = [
  User("Pengawas 1", "Pengawas", "pengawas@gmail.com", "0812345678"),
  User("Pengawas 2", "Pengawas", "pengawas@gmail.com", "0812345678"),
  User("Pengawas 3", "Pengawas", "pengawas@gmail.com", "0812345678"),
  User("Admin 1", "Admin", "pengawas@gmail.com", "0812345678"),
  User("Admin 2", "Admin", "pengawas@gmail.com", "0812345678"),
];
List customer = [
  User("Customer 1", "Customer", "johnston123@gmail.com", "0812345678"),
  User("Customer 2", "Customer", "johnston123@gmail.com", "0812345678"),
  User("Customer 3", "Customer", "johnston123@gmail.com", "0812345678"),
  User("Customer 4", "Customer", "johnston123@gmail.com", "0812345678"),
  User("Customer 5", "Customer", "johnston123@gmail.com", "0812345678"),
];
