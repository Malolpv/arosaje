import 'package:arosaje/models/comment.dart';
import 'package:arosaje/models/mission.dart';
import 'package:arosaje/models/picture.dart';
import 'package:arosaje/models/plant.dart';
import 'package:arosaje/models/profile.dart';
import 'package:arosaje/models/user.dart';

class RemoteDataManager {
  final List<User> _usersUseCase = <User>[
    const User(1, "uid1", "test@gmail.com", "test", "access"),
    const User(2, "uid2", "test2@gmail.com", "test", "access")
  ];

  final List<Profile> _profileUseCase = <Profile>[
    Profile(1, "uid1", "Malo", ""),
    Profile(2, "uid2", "Alex", "")
  ];

  final List<Plant> _plantsUseCase = <Plant>[
    Plant(1, "hortensia", 1, "image_test_plant.jpg", <Comment>[], <Picture>[],
        <Mission>[]),
    Plant(2, "tulipe", 1, "image_test_plant.jpg", <Comment>[], <Picture>[],
        <Mission>[])
  ];

  final List<Mission> _missionsUseCase = <Mission>[
    Mission(1, 1, 1, "garde d'hortensia", DateTime.now(),
        DateTime.now().add(const Duration(days: 7))),
    Mission(2, 1, 2, "garde de tulipe", DateTime.now(),
        DateTime.now().add(const Duration(days: 3))),
  ];

  final List<Picture> _picturesUseCase = <Picture>[
    Picture(1, 1, 1, DateTime.now().subtract(const Duration(days: 1))),
    Picture(2, 1, null, DateTime.now()),
    Picture(3, 2, 2, DateTime.now())
  ];

  Future<User?> loadCurrentUser(int idUser) {
    return Future.value(
        _usersUseCase.firstWhere((element) => element.id == idUser));
  }

  Future<User?> checkUserCredentials(String email, String pass) {
    return Future.value(_usersUseCase.firstWhere(
        (element) => element.email == email && element.pass == pass));
  }

  Future<List<Plant>> loadAllPlants(int profileId) {
    return Future.value(_plantsUseCase
        .where((element) => element.profileId == profileId)
        .toList());
  }

  Future<Profile?> loadProfileByUserUid(String userUid) {
    return Future.value(
        _profileUseCase.firstWhere((element) => element.userUid == userUid));
  }

  Future<List<Mission>> loadMissions(int idProfile) {
    return Future.value(_missionsUseCase
        .where((element) => element.profileId == idProfile)
        .toList());
  }

  Future<List<Picture>> loadPlantPictures(int plantId) {
    return Future.value(_picturesUseCase
        .where((element) => element.plantId == plantId)
        .toList());
  }

  Future<List<Picture>> loadMissionPictures(int missionId) {
    return Future.value(_picturesUseCase
        .where((element) => element.missionId == missionId)
        .toList());
  }

  Future<Picture> savePicture(String localPath, int plantId, int missionId) {
    //TODO SAVE PICTURE
    localPath = "image_test_plant.jpeg";
    return Future.value(
        Picture(4, plantId, missionId, DateTime.now(), path: localPath));
  }
}
