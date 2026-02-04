import 'package:flutter/material.dart';
import 'package:fultter_web_practice/domain/models/match_model.dart';
import 'package:intl/intl.dart';

class MatchCard extends StatelessWidget {
  final SoccerMatch match;

  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                match.leagueName,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              _buildStatusBadge(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildTeamInfo(match.homeTeam, isHome: true)),
              _buildScoreInfo(),
              Expanded(child: _buildTeamInfo(match.awayTeam, isHome: false)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            DateFormat('MMM d, HH:mm').format(match.date),
            style: TextStyle(
              color: Colors.white.withOpacity(0.3),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamInfo(Team team, {required bool isHome}) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            shape: BoxShape.circle,
          ),
          child: Image.network(
            team.logoUrl,
            errorBuilder: (_, __, ___) => const Icon(Icons.shield),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          team.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildScoreInfo() {
    if (match.status == MatchStatus.scheduled) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'VS',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.white24,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${match.score.home}',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
          const Text(
            ' : ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white38,
            ),
          ),
          Text(
            '${match.score.away}',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color bgColor;
    String text;
    Color textColor = Colors.white;

    switch (match.status) {
      case MatchStatus.live:
        bgColor = Colors.redAccent;
        text = 'LIVE';
        break;
      case MatchStatus.finished:
        bgColor = Colors.white10;
        text = 'FINISHED';
        textColor = Colors.white54;
        break;
      case MatchStatus.scheduled:
        bgColor = const Color(0xFF22C55E).withOpacity(0.2);
        text = 'UPCOMING';
        textColor = const Color(0xFF22C55E);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
