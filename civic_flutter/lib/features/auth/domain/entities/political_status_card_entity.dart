import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';

class PoliticalStatusCardEntity {
  PoliticalStatusCardEntity({
    required this.title,
    required this.subTitle,
    required this.politicalStatus,
  });
  final String title;
  final String subTitle;
  final PoliticalStatus politicalStatus;
}

List<PoliticalStatusCardEntity> allStatus = [
  PoliticalStatusCardEntity(
    title: TTexts.currentLeader,
    subTitle: TTexts.currentLeaderSubtitle,
    politicalStatus: PoliticalStatus.current,
  ),
  PoliticalStatusCardEntity(
    title: TTexts.formerLeader,
    subTitle: TTexts.formerLeaderSubtitle,
    politicalStatus: PoliticalStatus.former,
  ),
  PoliticalStatusCardEntity(
    title: TTexts.aspiringLeader,
    subTitle: TTexts.aspiringLeaderSubtitle,
    politicalStatus: PoliticalStatus.aspiring,
  ),
  PoliticalStatusCardEntity(
    title: TTexts.concernedCitizen,
    subTitle: TTexts.concernedCitizenSubtitle,
    politicalStatus: PoliticalStatus.none,
  ),
];
