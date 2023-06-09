part of 'my_certificate.bloc.dart';

enum MyCertificateStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == MyCertificateStatus.initial;
  bool get isLoading => this == MyCertificateStatus.loading;
  bool get isSuccess => this == MyCertificateStatus.success;
  bool get isError => this == MyCertificateStatus.error;
}

class MyCertificateState extends Equatable {
  const MyCertificateState({
    this.status = MyCertificateStatus.initial,
    this.certificates,
    this.error,
  });

  final MyCertificateStatus status;
  final List<NFTModel>? certificates;
  final String? error;

  @override
  List<Object?> get props => [
        status,
        certificates,
        error,
      ];

  MyCertificateState copyWith({
    MyCertificateStatus? status,
    List<NFTModel>? certificates,
    String? error,
  }) {
    return MyCertificateState(
      status: status ?? this.status,
      certificates: certificates ?? this.certificates,
      error: error ?? this.error,
    );
  }
}
