import 'package:bloc/bloc.dart';
import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_bloc/src/mixter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required LlmApiRepository llmApiRepository,
  })  : _llmApiRepository = llmApiRepository,
        super(const SettingsLoading()) {
    on<SettingsLoad>(_onSettingsLoad);

    add(const SettingsLoad());
  }

  final LlmApiRepository _llmApiRepository;

  Future<void> _onSettingsLoad(
    SettingsLoad event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsLoading());

    final result = await _llmApiRepository.getLlmApiProviders();

    switch (result) {
      case ResultSuccess(value: final apiProviders):
        emit(SettingsData(apiProviders: apiProviders));
      case ResultFailure(failure: final failure):
        emit(SettingsFailure(failure: failure));
    }
  }
}
