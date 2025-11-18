import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
//dioclient
import 'package:nailxinh/core/network/dio_client.dart';
import 'package:nailxinh/core/network/auth_interceptor.dart';
import 'package:nailxinh/datas/datasources/user_data.dart';
import 'package:nailxinh/datas/repositoriesimpl/user_repository_impl.dart';
import 'package:nailxinh/domain/repositories/user_repository.dart';
import 'package:nailxinh/domain/usecases/get_user.dart';
import 'package:nailxinh/domain/usecases/check_user.dart';
import 'package:nailxinh/domain/usecases/get_role.dart';
//authrepository
import 'package:nailxinh/domain/repositories/auth_repository.dart';
import 'package:nailxinh/datas/repositoriesimpl/auth_repository_impl.dart';
import 'package:nailxinh/datas/datasources/auth_data.dart';
import 'package:nailxinh/datas/datasources/login_data.dart';
import 'package:nailxinh/datas/datasources/register_data.dart';
import 'package:nailxinh/domain/usecases/register_user.dart';
import 'package:nailxinh/domain/usecases/login_usecase.dart';
import 'package:nailxinh/domain/usecases/refreshToken_usecase.dart';
import 'package:nailxinh/domain/usecases/logout_usecase.dart';

//search history
import 'package:nailxinh/datas/local/search_history_storage.dart';
import 'package:nailxinh/domain/repositories/search_repository.dart';
import 'package:nailxinh/datas/repositoriesimpl/search_repository_impl.dart';
import 'package:nailxinh/domain/usecases/search_usecases/add_keyword.dart';
import 'package:nailxinh/domain/usecases/search_usecases/clear_history_search.dart';
import 'package:nailxinh/domain/usecases/search_usecases/getHistoryUsecase.dart';

import 'package:nailxinh/domain/usecases/search_usecases/search_suggestion_usecase.dart';
import 'package:nailxinh/datas/datasources/product_data/search_suggestion_data.dart';
import 'package:nailxinh/domain/repositories/product_repository/search_suggestion_repository.dart';
import 'package:nailxinh/datas/repositoriesimpl/product_repository_impl/search_suggestion_reposirory_impl.dart';

import 'package:nailxinh/domain/usecases/product_usecase/search_product_usecase.dart';
import 'package:nailxinh/datas/datasources/product_data/search_products.dart';
import 'package:nailxinh/domain/repositories/product_repository/search_product_repository.dart';
import 'package:nailxinh/datas/repositoriesimpl/product_repository_impl/search_product_repository_impl.dart';

//cartitem
import '../../datas/datasources/cartItem_data/cart_item_data.dart';
import '../../datas/repositoriesimpl/cart_item_repository_impl/cart_item_repository_impl.dart';
import '../../domain/repositories/cart_item_repository/cart_item_repository.dart';
import '../../domain/usecases/cartItem_usecase/add_cartItem_usecase.dart';
import '../../domain/usecases/cartItem_usecase/delete_cartItem_usecase.dart';
import '../../domain/usecases/cartItem_usecase/get_all_cartItem_uc.dart';
import '../../domain/usecases/cartItem_usecase/update_cartItem_usecase.dart';
import '../../domain/usecases/cartItem_usecase/get_cartItem_uc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  //GetRoleUseCase
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  final storage = sl<FlutterSecureStorage>();
  late AuthRepositoryImpl authRepository;

  final authInterceptor = AuthInterceptor(
    storage: storage,
    getAuthRepository: () => authRepository,
  );

  // create a Dio that has the auth interceptor and same baseUrl
  final dio = DioClient.create(authInterceptor);
  sl.registerLazySingleton<Dio>(() => dio);

  sl.registerLazySingleton<AuthData>(() => AuthDataImpl(sl<Dio>()));
  sl.registerLazySingleton<LoginData>(() => LoginDataImpl(sl<Dio>()));
  sl.registerLazySingleton<RegisterData>(() => RegisterDataImpl(sl<Dio>()));
  sl.registerLazySingleton<AuthRepository>(() {
    authRepository = AuthRepositoryImpl(
      sl<LoginData>(),
      sl<FlutterSecureStorage>(),
      sl<AuthData>(),
      sl<RegisterData>(),
    );
    return authRepository;
  });
  // ======getUsser=======
  sl.registerLazySingleton<UserData>(() => UserDataImpl(sl<Dio>()));

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerLazySingleton<GetUsers>(() => GetUsers(sl()));
  //CheckUser
  sl.registerLazySingleton<CheckUserExistsUseCase>(
    () => CheckUserExistsUseCase(sl()),
  );
  sl.registerLazySingleton<GetRoleUseCase>(() => GetRoleUseCase(sl()));
  //registerUser
  sl.registerLazySingleton<RegisterUser>(() => RegisterUser(sl()));
  //loginUser
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
  //refreshToken
  sl.registerLazySingleton<RefreshTokenUseCase>(
    () => RefreshTokenUseCase(sl()),
  );
  //logout
  sl.registerLazySingleton<LogoutUsecase>(() => LogoutUsecase(sl()));

  //SearchHistoryStorage
  sl.registerLazySingleton<SearchHistoryStorage>(() => SearchHistoryStorage());

  sl.registerLazySingleton<SearchHistoryRepository>(
    () => SearchHistoryRepositoryImpl(sl()),
  );
  //AddKeyword(
  sl.registerLazySingleton<AddKeyword>(() => AddKeyword(sl()));
  //ClearHistorySearch
  sl.registerLazySingleton<ClearHistorySearch>(() => ClearHistorySearch(sl()));
  //GetHistoryUsecase
  sl.registerLazySingleton<GetSearchHistory>(() => GetSearchHistory(sl()));
  //SearchSuggestionUseCase
  //SearchSuggestionRepository
  //SearchSuggestionData
  sl.registerLazySingleton<SearchSuggestionData>(
    () => SearchSuggestionDataImpl(sl<Dio>()),
  );

  sl.registerLazySingleton<SearchSuggestionRepository>(
    () => SearchSuggestionRepositoryImpl(sl<SearchSuggestionData>()),
  );

  sl.registerLazySingleton<SearchSuggestionUseCase>(
    () => SearchSuggestionUseCase(sl()),
  );

  //searchproductussecase
  sl.registerLazySingleton<SearchProductData>(
    () => SearchProductDataImpl(sl<Dio>()),
  );

  sl.registerLazySingleton<SearchProductRepository>(
    () => SearchProductRepositoryImpl(sl<SearchProductData>()),
  );

  sl.registerLazySingleton<SearchProductUseCase>(
    () => SearchProductUseCase(sl()),
  );

  //fetch cartItem
  sl.registerLazySingleton<CartItemData>(() => CartItemDataImpl(sl<Dio>()));
  sl.registerLazySingleton<CartItemRepository>(
    () => CartItemRepositoryImpl(sl<CartItemData>()),
  );
  sl.registerLazySingleton<CreateCartItemUseCase>(
    () => CreateCartItemUseCase(sl<CartItemRepository>()),
  );
  sl.registerLazySingleton<DeleteCartItemUseCase>(
    () => DeleteCartItemUseCase(sl<CartItemRepository>()),
  );
  sl.registerLazySingleton<GetAllCartItemUseCase>(
    () => GetAllCartItemUseCase(sl<CartItemRepository>()),
  );
  sl.registerLazySingleton<UpdateCartItemUseCase>(
    () => UpdateCartItemUseCase(sl<CartItemRepository>()),
  );
}
