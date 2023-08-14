class User {
  final int id;
  final String user_name;
  final String phone_number;
  final String email_address;
  final String job;
  final String role;

  User(
      this.id,
      this.user_name,
      this.email_address,
      this.phone_number,
      this.job,
      this.role,
  );
}

List admin = [
  User(1,"Pengawas 1", "pengawas@gmail.com", "0812345678", "Admin","Pengawas"),
  User(1,"Admin 1", "admin@gmail.com", "0812345678", "Admin","Pengawas"),
];
List customer = [
  User(1,"Customer 1", "customer@gmail.com", "08123456456", "Dosen", "Customer"),
  User(2,"Customer 1", "customer@gmail.com", "08123456456", "Dosen", "Customer"),
  User(3,"Customer 1", "customer@gmail.com", "08123456456", "Dosen", "Customer"),
];
