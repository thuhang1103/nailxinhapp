import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/auth_bloc.dart';
import '../../../blocs/states/auth_state.dart';
import 'package:go_router/go_router.dart';
import '../../../routers/router_path.dart';
//color
import '../../../core/color/mycolor.dart';
import '../../../features/fetch_profile/fetch_profile_bloc.dart';
import '../../../features/fetch_profile/fetch_profile_event.dart';
import '../../../features/fetch_profile/fetch_profile_state.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FetchProfileBloc>().add(GetProfile());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is! Authenticated) {
              context.go(RoutePaths.login);
            }
          },
        ),

        BlocListener<FetchProfileBloc, FetchProfileState>(
          listenWhen: (p, c) => p.updateProfileState != c.updateProfileState,
          listener: (context, state) {
            state.updateProfileState.maybeWhen(
              success: (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cập nhật thành công')),
                );
                context.pop();
              },
              error: (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Cập nhật thất bại')));
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: MyColor.pinkColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: MyColor.textColor),
          title: const Text(
            'Cập nhật hồ sơ',
            style: TextStyle(color: MyColor.textColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<FetchProfileBloc, FetchProfileState>(
            builder: (context, state) {
              final isLoading = state.updateProfileState.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Họ và tên'),
                    controller: TextEditingController(text: state.fullName)
                      ..selection = TextSelection.collapsed(
                        offset: state.fullName.length,
                      ),
                    onChanged: (value) {
                      context.read<FetchProfileBloc>().add(NameChanged(value));
                    },
                  ),

                  const SizedBox(height: 16),

                  /// 📞 PHONE
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại',
                    ),
                    controller: TextEditingController(text: state.phone)
                      ..selection = TextSelection.collapsed(
                        offset: state.phone.length,
                      ),
                    onChanged: (value) {
                      context.read<FetchProfileBloc>().add(PhoneChanged(value));
                    },
                  ),

                  const SizedBox(height: 32),

                  /// 🔘 BUTTON UPDATE
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<FetchProfileBloc>().add(
                              UpdateProfileEvent(),
                            );
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Cập nhật'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
