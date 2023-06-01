import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qubit/repositories/info_repository.dart';

part 'home_cubit.freezed.dart';
part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  final InfoRepository infoRepository;
  HomeCubit(this.infoRepository) : super(HomeCubitState.init(productItems: infoRepository.getInfo()));

  updateInfo() {
    final result = infoRepository.getInfo();
    result.addAll({4: 'Виноград'});

    emit(
      HomeCubitState.init(productItems: result),
    );
  }
}
