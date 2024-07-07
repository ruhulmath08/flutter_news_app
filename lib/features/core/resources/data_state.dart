import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? dioException;

  DataState({this.data, this.dioException});
}

class DataSuccess<T> extends DataState {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState {
  DataFailed(DioException dioException) : super(dioException: dioException);
}
