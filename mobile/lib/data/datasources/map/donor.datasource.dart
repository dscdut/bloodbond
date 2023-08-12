import 'dart:math';

import 'package:bloodbond/common/constants/blood_enum.dart';
import 'package:bloodbond/data/models/address/coordinate.model.dart';
import 'package:bloodbond/data/models/donor.model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DonorDataSource {
  DonorDataSource();

  //func random location in lat lng bound: (16.128737, 108.110936) (15.973338, 108.275822)

  Coordinate randomLocation() {
    final random = Random();
    final lat = 16.128737 + random.nextDouble() * (15.973338 - 16.128737);
    final lng = 108.110936 + random.nextDouble() * (108.275822 - 108.110936);
    return Coordinate(lat: lat, lng: lng);
  }

  //random name like real with name is 2 words Nhàn, Nhàn, Thịnh, Tuyền, Quý, Quân, Nam, Huy, Ngọc, Kiệm
  String randomName() {
    final random = Random();
    final firstName = [
      'Nhàn',
      'Nhàn',
      'Thịnh',
      'Tuyền',
      'Quý',
      'Quân',
      'Nam',
      'Huy',
      'Ngọc',
      'Kiệm'
    ];
    final lastName = [
      'Nguyễn',
      'Trần',
      'Lê',
      'Phạm',
      'Hoàng',
      'Huỳnh',
      'Phan',
      'Vũ',
      'Võ',
      'Đặng',
      'Bùi',
      'Đỗ',
      'Hồ',
      'Ngô',
      'Dương',
      'Lý',
      'An',
      'Bạch',
      'Bành',
      'Bảo',
      'Biên',
      'Cao',
      'Châu',
      'Chung',
      'Chu',
      'Chung',
      'Chử',
      'Chử',
      'Cung',
      'Cao',
      'Cái',
      'Cát',
      'Cầm',
      'Cao',
      'Cổ',
      'Cù',
      'Cung'
    ];
    return '${firstName[random.nextInt(firstName.length)]} ${lastName[random.nextInt(lastName.length)]}';
  }

  Future<List<DonorModel>> getDonors() async {
    return [
      DonorModel(
        donorId: '1',
        name: randomName(),
        bloodType: BloodType.bMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '2',
        name: randomName(),
        bloodType: BloodType.aMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '3',
        name: randomName(),
        bloodType: BloodType.aPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '4',
        name: randomName(),
        bloodType: BloodType.oMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '5',
        name: randomName(),
        bloodType: BloodType.oPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '6',
        name: randomName(),
        bloodType: BloodType.abMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '7',
        name: randomName(),
        bloodType: BloodType.abPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '8',
        name: randomName(),
        bloodType: BloodType.bPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '9',
        name: randomName(),
        bloodType: BloodType.bMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '10',
        name: randomName(),
        bloodType: BloodType.aMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '11',
        name: randomName(),
        bloodType: BloodType.aPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '12',
        name: randomName(),
        bloodType: BloodType.oMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '13',
        name: randomName(),
        bloodType: BloodType.oPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '14',
        name: randomName(),
        bloodType: BloodType.abMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '15',
        name: randomName(),
        bloodType: BloodType.abPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '16',
        name: randomName(),
        bloodType: BloodType.bPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '17',
        name: randomName(),
        bloodType: BloodType.bMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '18',
        name: randomName(),
        bloodType: BloodType.aMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '19',
        name: randomName(),
        bloodType: BloodType.aPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '20',
        name: randomName(),
        bloodType: BloodType.oMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '21',
        name: randomName(),
        bloodType: BloodType.oPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '22',
        name: randomName(),
        bloodType: BloodType.abMinus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '23',
        name: randomName(),
        bloodType: BloodType.abPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
      DonorModel(
        donorId: '24',
        name: randomName(),
        bloodType: BloodType.bPlus,
        description: 'Blood',
        phone: '123456789',
        location: randomLocation(),
      ),
    ];
  }
}
