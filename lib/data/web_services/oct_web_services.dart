import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';


class OctResult{
   Dio ? dio ;
   // OctResult(){
   //   BaseOptions options = BaseOptions(
   //     baseUrl: 'http://127.0.0.1:8000/api/',
   //     receiveDataWhenStatusError: true,
   //     connectTimeout: 20 * 1000, // 60 seconds,
   //     receiveTimeout: 20 * 1000,
   //   );
   //   dio = Dio(options);
   // }
   Future<List<dynamic>> oct(List<int> file, String fileName) async {
     var formData = FormData.fromMap({
       "image": MultipartFile.fromBytes(
         file,
         filename: fileName,
         contentType: MediaType("image", "png"),
       )

     });
     try {
       Response response = await dio!.post('http://127.0.0.1:8000/api/UploadImage', data: formData);
       print('----------------------');
       print(response.data.toString());
       return response.data;
     } catch (e) {
       print(e.toString());
       return [];
     }

   }
}
///