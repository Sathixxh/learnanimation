
// import 'package:flutter/material.dart';
// import 'package:learnanimation/themprovider.dart';

// class AppWithTheme extends StatelessWidget {
//   final String initialRoute;

//   const AppWithTheme({super.key, required this.initialRoute});
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     return Theme(
//       data: Theme.of(context),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'FLATTRADE',
//         themeMode: themeProvider.themeModeValue,
//         theme: ThemeDataClass.lightTheme,
//         darkTheme: ThemeDataClass.darkTheme,
//         initialRoute: '/',
//         // onGenerateRoute: AppRoutes().onGenerateRoute,
//       ),
//     );
//   }
// }



// class InternetCubit extends Cubit<InternetState> {
//   final Connectivity connectivity;
//   StreamSubscription<ConnectivityResult>? connectivityStreamSubscription;

//   InternetCubit({required this.connectivity}) : super(InternetLoading()) {
//     monitorInternetConnection();
//   }

//   monitorInternetConnection() {
//     return connectivityStreamSubscription =
//         connectivity.onConnectivityChanged.listen((connectivityResult) {
//       if (connectivityResult == ConnectivityResult.wifi) {
//         emitInternetConnected(ConnectivityResult.wifi);
//       } else if (connectivityResult == ConnectivityResult.mobile) {
//         emitInternetConnected(ConnectivityResult.mobile);
//       } else if (connectivityResult == ConnectivityResult.none) {
//         emitInternetDisconnected();
//       }
//     });
//   }

//   void emitInternetDisconnected() => emit(InternetDisconnected());

//   void emitInternetConnected(ConnectivityResult _connectionType) =>
//       emit(InternetConnected(connectionType: _connectionType));

//   @override
//   Future<void> close() {
//     connectivityStreamSubscription!.cancel();
//     return super.close();
//   }
// }
