class Team {
  final String id;
  final String name;
  final String logoUrl;

  Team({required this.id, required this.name, required this.logoUrl});
}

enum MatchStatus { scheduled, live, finished }

class MatchScore {
  final int home;
  final int away;

  MatchScore({this.home = 0, this.away = 0});
}

class SoccerMatch {
  final String id;
  final Team homeTeam;
  final Team awayTeam;
  final MatchScore score;
  final DateTime date;
  final MatchStatus status;
  final String leagueName;

  SoccerMatch({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.date,
    required this.status,
    required this.leagueName,
  });
}
