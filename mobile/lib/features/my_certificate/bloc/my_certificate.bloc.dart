import 'package:bloc/bloc.dart';
import 'package:bloodbond/data/models/nft.model.dart';
import 'package:bloodbond/data/repositories/nft.repository.dart';
import 'package:equatable/equatable.dart';

part 'my_certificate.event.dart';
part 'my_certificate.state.dart';

class MyCertificateBloc extends Bloc<MyCertificateEvent, MyCertificateState> {
  MyCertificateBloc({required NFTRepository nftRepository})
      : _nftRepository = nftRepository,
        super(const MyCertificateState()) {
    on<MyCertificateEvent>((event, emit) {});
    on<MyCertificateFetchEvent>(_onFetchCertificates);
    add(MyCertificateFetchEvent());
  }
  final NFTRepository _nftRepository;

  Future<void> _onFetchCertificates(
    MyCertificateFetchEvent event,
    Emitter<MyCertificateState> emit,
  ) async {
    emit(state.copyWith(status: MyCertificateStatus.loading));
    // try {
    final List<NFTModel> certificates = await _nftRepository.getNFTs();
    emit(
      state.copyWith(
        status: MyCertificateStatus.success,
        certificates: certificates,
      ),
    );
    // } catch (e) {
    //   emit(
    //     state.copyWith(
    //       status: MyCertificateStatus.error,
    //       error: e.toString(),
    //     ),
    //   );
    // }
  }
}
