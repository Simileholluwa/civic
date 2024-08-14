import 'package:civic_client/civic_client.dart';

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
    title: 'Current',
    subTitle: 'I am currently holding a political position.',
    politicalStatus: PoliticalStatus.current,
  ),
  PoliticalStatusCardEntity(
    title: 'Former',
    subTitle: 'I have previously held a political position.',
    politicalStatus: PoliticalStatus.former,
  ),
  PoliticalStatusCardEntity(
    title: 'Aspiring',
    subTitle: 'I have aspirations of holding a political position.',
    politicalStatus: PoliticalStatus.aspiring,
  ),
  PoliticalStatusCardEntity(
    title: 'None',
    subTitle: 'I do not have interest in holding a political position.',
    politicalStatus: PoliticalStatus.none,
  ),
];
