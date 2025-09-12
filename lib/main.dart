import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nailxinh/domain/usecases/get_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/ui/pages/adminPages/admin_page.dart';
import 'package:nailxinh/ui/pages/customerPages/myhome_page.dart';

import 'blocs/bloc/user_bloc.dart';
import 'datas/datasources/user_data.dart';
import 'datas/repositoriesimpl/user_repository_impl.dart';

Future<void> main() async {
  // Khởi tạo repository
  final userdata = UserDataImpl(http.Client());
  final userRepository = UserRepositoryImpl(userdata);

  // Khởi tạo usecase
  final getUsers = GetUsers(userRepository);

  runApp(MyApp(getUsers: getUsers));
}



class MyApp extends StatelessWidget {
  final GetUsers getUsers;
  const MyApp({super.key, required this.getUsers});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(getUsers: getUsers),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        // home:  MyHomePage(),
        home: MyHomePage(),
      ),
    );
  }
}
