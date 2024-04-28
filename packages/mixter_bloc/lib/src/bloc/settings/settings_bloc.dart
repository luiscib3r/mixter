import 'package:bloc/bloc.dart';
import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_bloc/src/mixter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required LlmApiBloc llmApiBloc,
    required LlmApiRepository llmApiRepository,
  })  : _llmApiBloc = llmApiBloc,
        _llmApiRepository = llmApiRepository,
        super(const SettingsLoading()) {
    on<SettingsLoad>(_onSettingsLoad);
    on<SettingsSelectLlmProvider>(_onSettingsSelectProvider);
    on<SettingsSetUrl>(_onSettingsSetUrl);
    on<SettingsSetApiKey>(_onSettingsSetApiKey);
    on<SettingsSetModelId>(_onSettingsSetModelId);
    on<SettingsSave>(_onSettingsSave);

    add(const SettingsLoad());
  }

  final LlmApiBloc _llmApiBloc;
  final LlmApiRepository _llmApiRepository;

  void reload() {
    add(const SettingsLoad());
  }

  Future<void> _onSettingsLoad(
    SettingsLoad event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsLoading());

    final result = await _llmApiRepository.getLlmProviders();

    switch (result) {
      case ResultSuccess(value: final llmProviders):
        emit(SettingsData(llmProviders: llmProviders));
      case ResultFailure(failure: final failure):
        emit(SettingsFailure(failure: failure));
    }
  }

  void selectProvider(LlmProvider value) {
    add(SettingsSelectLlmProvider(value));
  }

  Future<void> _onSettingsSelectProvider(
    SettingsSelectLlmProvider event,
    Emitter<SettingsState> emit,
  ) async {
    if (state is SettingsData) {
      emit(
        SettingsData(
          llmProviders: (state as SettingsData).llmProviders,
          llmApi: LlmApi(
            name: event.value.name,
            url: event.value.url,
            type: event.value.type,
            modelId: '',
          ),
        ),
      );

      final result = await _llmApiRepository.getLlmModels(event.value.id);

      switch (result) {
        case ResultSuccess(value: final models):
          emit(
            SettingsData(
              llmProviders: (state as SettingsData).llmProviders,
              llmApi: (state as SettingsData).llmApi,
              llmModels: models,
            ),
          );
        default:
      }
    }
  }

  void setUrl(String value) {
    add(SettingsSetUrl(value.trim()));
  }

  void _onSettingsSetUrl(
    SettingsSetUrl event,
    Emitter<SettingsState> emit,
  ) {
    if (state is SettingsData) {
      emit(
        SettingsData(
          llmProviders: (state as SettingsData).llmProviders,
          llmApi: (state as SettingsData).llmApi?.copyWith(url: event.value),
          llmModels: (state as SettingsData).llmModels,
        ),
      );
    }
  }

  void setApiKey(String value) {
    add(SettingsSetApiKey(value.trim()));
  }

  void _onSettingsSetApiKey(
    SettingsSetApiKey event,
    Emitter<SettingsState> emit,
  ) {
    if (state is SettingsData) {
      emit(
        SettingsData(
          llmProviders: (state as SettingsData).llmProviders,
          llmApi: (state as SettingsData).llmApi?.copyWith(apiKey: event.value),
          llmModels: (state as SettingsData).llmModels,
        ),
      );
    }
  }

  void setModelId(String value) {
    add(SettingsSetModelId(value.trim()));
  }

  void _onSettingsSetModelId(
    SettingsSetModelId event,
    Emitter<SettingsState> emit,
  ) {
    if (state is SettingsData) {
      emit(
        SettingsData(
          llmProviders: (state as SettingsData).llmProviders,
          llmApi:
              (state as SettingsData).llmApi?.copyWith(modelId: event.value),
          llmModels: (state as SettingsData).llmModels,
        ),
      );
    }
  }

  void save() {
    add(const SettingsSave());
  }

  void _onSettingsSave(
    SettingsSave event,
    Emitter<SettingsState> emit,
  ) {
    if (state is SettingsData && (state as SettingsData).isValid) {
      _llmApiBloc.add(LlmApiSetLlmApi((state as SettingsData).llmApi!));
    }
  }
}
