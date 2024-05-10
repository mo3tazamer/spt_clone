import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../utils/app_strings.dart';
import 'exceptions.dart';
import 'failures.dart';




/// A mixin that provides exception handling for repository server operations.
///
/// This mixin is intended to be used with classes that interact with a server
/// repository. It provides a method, `serverExceptionHandler`, that handles
/// exceptions thrown during server operations and returns a `Result` object
/// representing the success or failure of the operation.
///
/// The `serverExceptionHandler` method takes a `computation` parameter, which
/// is a `Future` or `FutureOr` representing the server operation to be
/// performed. It also accepts an optional `unknownMessage` parameter, which
/// specifies the default error message to use if the server exception does not
/// provide a specific error message.
///
/// If the device is connected to the internet, the `serverExceptionHandler`
/// method attempts to execute the `computation` and returns a `Success` result
/// if successful. If a `ServerException` is thrown during the execution, it
/// converts the exception into a `ServerFailure` and returns an `Error` result
/// with the failure. If the device is not connected to the internet, it returns
/// an `Error` result with a `NetworkFailure` indicating the lack of internet
/// connection.
///
/// Example usage:
/// ```dart
/// class MyRepository with RepositoryServerExceptionMixin {
///   Future<Result<String, Failure>> fetchData() async {
///     return serverExceptionHandler<String>(
///       _fetchDataFromServer(),
///       unknownMessage: 'An error occurred while fetching data.',
///     );
///   }
///
///   Future<String> _fetchDataFromServer() async {
///     // Perform server operation here
///   }
/// }
/// ```
mixin RepositoryServerExceptionMixin on Object {
  Future<bool> get isConnected;
  Future<Result<S, Failure>> serverExceptionHandler<S>(
    FutureOr computation, {
    String unknownMessage = AppStrings.somethingWentWrong,
  }) async {
    if (await isConnected) {
      try {
        return Success(await computation);
      } on ServerException catch (error) {
        return Error(
          ServerFailure(
            message: error.message ?? unknownMessage,
          ),
        );
      }
    } else {
      return const Error(
        NetworkFailure(
          message: AppStrings.noInternetConnection,
        ),
      );
    }
  }
}


// mixin RepositoryExceptionMixin on Object {
//   Future<bool> get isConnected;
//   Future<Result<S, Failure>> serverExceptionHandler<S>(
//     FutureOr computation, {
//     String unknownMessage = AppStrings.somethingWentWrong,
//   }) async {
//     if (await isConnected) {
//       try {
//         return Success(await computation);
//       } on ServerException catch (error) {
//         return Error(
//           ServerFailure(
//             message: error.message ?? unknownMessage.trans(),
//           ),
//         );
//       }
//     } else {
//       return Error(
//         NetworkFailure(
//           message: AppStrings.noInternetConnection.trans(),
//         ),
//       );
//     }
//   }
// }
