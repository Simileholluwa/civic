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
          subTitle: 'Actively holding an office, and implementing policies '
              'to govern and guide your community or nation.',
          politicalStatus: PoliticalStatus.current,
        ),
    PoliticalStatusCardEntity(
          title: 'Former',
          subTitle: 'Previously held an office contributing to governance '
              'and policy-making in your community or nation.',
          politicalStatus: PoliticalStatus.former,
        ),
    PoliticalStatusCardEntity(
          title: 'Aspiring',
          subTitle: 'Building support, gaining experiences, and developing '
              'a clear agenda to address key societal issues.',
          politicalStatus: PoliticalStatus.aspiring,
        ),
    PoliticalStatusCardEntity(
          title: 'None',
          subTitle: 'Never held an office but passionate about redefining the '
              'Nigerian political landscape.',
          politicalStatus: PoliticalStatus.none,
        ),
  ];
