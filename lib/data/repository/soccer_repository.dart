import 'package:fultter_web_practice/domain/models/match_model.dart';
import 'dart:async';

abstract class SoccerRepository {
  Future<List<SoccerMatch>> getTopMatches();
}

class MockSoccerRepository implements SoccerRepository {
  @override
  Future<List<SoccerMatch>> getTopMatches() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      SoccerMatch(
        id: '1',
        homeTeam: Team(
          id: 't1',
          name: 'Real Madrid',
          logoUrl: 'https://crests.football-data.org/86.png',
        ),
        awayTeam: Team(
          id: 't2',
          name: 'Barcelona',
          logoUrl: 'https://crests.football-data.org/81.png',
        ),
        score: MatchScore(home: 2, away: 1),
        date: DateTime.now().subtract(const Duration(hours: 2)),
        status: MatchStatus.live,
        leagueName: 'La Liga',
      ),
      SoccerMatch(
        id: '2',
        homeTeam: Team(
          id: 't3',
          name: 'Man City',
          logoUrl: 'https://crests.football-data.org/65.png',
        ),
        awayTeam: Team(
          id: 't4',
          name: 'Liverpool',
          logoUrl: 'https://crests.football-data.org/64.png',
        ),
        score: MatchScore(home: 0, away: 0),
        date: DateTime.now().add(const Duration(hours: 3)),
        status: MatchStatus.scheduled,
        leagueName: 'Premier League',
      ),
      SoccerMatch(
        id: '3',
        homeTeam: Team(
          id: 't5',
          name: 'Bayern Munich',
          logoUrl: 'https://crests.football-data.org/5.png',
        ),
        awayTeam: Team(
          id: 't6',
          name: 'Dortmund',
          logoUrl: 'https://crests.football-data.org/4.png',
        ),
        score: MatchScore(home: 3, away: 0),
        date: DateTime.now().subtract(const Duration(days: 1)),
        status: MatchStatus.finished,
        leagueName: 'Bundesliga',
      ),
    ];
  }
}
