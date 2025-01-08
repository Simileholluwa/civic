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
    title: 'Current Leader',
    subTitle: 'I am currently holding a political position.',
    politicalStatus: PoliticalStatus.current,
  ),
  PoliticalStatusCardEntity(
    title: 'Former Leader',
    subTitle: 'I have previously held a political position.',
    politicalStatus: PoliticalStatus.former,
  ),
  PoliticalStatusCardEntity(
    title: 'Aspiring Leader',
    subTitle: 'I have political aspirations.',
    politicalStatus: PoliticalStatus.aspiring,
  ),
  PoliticalStatusCardEntity(
    title: 'Concerned Citizen',
    subTitle: 'I am passionate about making a change.',
    politicalStatus: PoliticalStatus.none,
  ),
];
