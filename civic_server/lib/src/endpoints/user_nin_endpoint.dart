import 'package:civic_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UserNinEndpoint extends Endpoint {
  Future<UserNinRecord?> getNinDetails(
      Session session, String ninNumber) async {
    final userRecord = await UserRecord.db.findFirstRow(
      session,
      where: (user) => user.nin.equals(ninNumber),
    );
    if (userRecord == null) {
      final authUser = await session.authenticated;
      if (authUser == null) {
        return null;
      }
      return UserNinRecord(
        firstName: 'Oluwatosin',
        surname: 'Ogunseye',
        residenceLga: 'Ikeja',
        residenceState: 'Lagos',
        residenceStatus: 'Resident',
        residenceTown: 'Ikeja',
        resisdenceAddressLine1: '8, Omodehinde street',
        telephone: '08012345678',
        photoUrl: 'https://www.google.com',
        gender: 'Male',
        birthdate: '1990-01-01',
        email: 'maxoluwatosin@gmail.com',
        ownerId: authUser.userId,
      );
    }
    return null;
  }
}
