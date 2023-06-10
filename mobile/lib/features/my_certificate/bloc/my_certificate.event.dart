part of 'my_certificate.bloc.dart';

abstract class MyCertificateEvent extends Equatable {
  const MyCertificateEvent();

  @override
  List<Object> get props => [];
}

class MyCertificateFetchEvent extends MyCertificateEvent {}
