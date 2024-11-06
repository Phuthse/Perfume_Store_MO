import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/login.dart'; 
import 'package:perfume_store_mo/pages/signingoogle.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfume Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Sử dụng StreamBuilder để theo dõi trạng thái đăng nhập
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),  // Theo dõi trạng thái người dùng
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Nếu đang chờ đợi trạng thái đăng nhập, hiển thị loading spinner
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Nếu có lỗi khi xác thực, bạn có thể hiển thị thông báo lỗi
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return Bottomnav();
            } else {
              return Bottomnav();
            }
          // Kiểm tra xem người dùng đã đăng nhập hay chưa
          if (snapshot.data == null) {
            // Nếu chưa đăng nhập, điều hướng đến trang đăng nhập
            return const LogIn();  // Trang đăng nhập của bạn
          } else {
            // Nếu đã đăng nhập, điều hướng đến trang Bottomnav
            return const Bottomnav();  // Trang chính của bạn sau khi đăng nhập
          }
        },
      ),
      //home: Adminlogin(),
    );
  }
}
