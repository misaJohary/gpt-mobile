import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/chat_repository.dart';

class GetResponseMessagesUsecase implements Usecase<dynamic, int> {
  final ChatRepository chatRepository;
  GetResponseMessagesUsecase(
    this.chatRepository,
  );
  @override
  Future<Either<Failure, dynamic>> call(int idConversation) async {
    return await chatRepository.getResponseMessages(idConversation);
  }
}