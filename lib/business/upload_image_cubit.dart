import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());
}
