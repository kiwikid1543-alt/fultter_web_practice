import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fultter_web_practice/domain/models/match_model.dart';
import 'package:fultter_web_practice/data/repository/soccer_repository.dart';

// 상태 클래스
class SoccerState {
  final List<SoccerMatch> matches;
  final bool isLoading;
  final String? error;

  SoccerState({this.matches = const [], this.isLoading = false, this.error});

  SoccerState copyWith({
    List<SoccerMatch>? matches,
    bool? isLoading,
    String? error,
  }) {
    return SoccerState(
      matches: matches ?? this.matches,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// Notifier (Riverpod 3.x style)
class SoccerNotifier extends Notifier<SoccerState> {
  @override
  SoccerState build() {
    // 초기 로딩 수행
    Future.microtask(() => fetchMatches());
    return SoccerState();
  }

  Future<void> fetchMatches() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = ref.read(soccerRepositoryProvider);
      final matches = await repository.getTopMatches();
      state = state.copyWith(matches: matches, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

// Provider 정의
final soccerRepositoryProvider = Provider<SoccerRepository>((ref) {
  return MockSoccerRepository();
});

final soccerProvider = NotifierProvider<SoccerNotifier, SoccerState>(
  SoccerNotifier.new,
);
