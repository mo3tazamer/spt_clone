import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../domain/entities/location.dart';
import '../../domain/use_cases/get_location.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  GetLocationUseCase getLocationUseCase;

  LocationCubit(this.getLocationUseCase) : super(LocationInitial());
  static LocationCubit get(context) => BlocProvider.of<LocationCubit>(context);

  Future<void> getCurrentLocation() async {
    emit(LocationLoading());
    final result = await getLocationUseCase();
    result.when(
        (success) => emit(
              LocationSuccess(location: success),
            ),
        (error) => emit(LocationError(message: error.message)));
  }
}
