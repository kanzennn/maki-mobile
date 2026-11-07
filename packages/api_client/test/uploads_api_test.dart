import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for UploadsApi
void main() {
  final instance = MakiApiClient().getUploadsApi();

  group(UploadsApi, () {
    // Ask for a place to upload a photo to
    //
    // The client then sends the file with `PUT` to `upload_url`, straight to the private bucket, with the `Content-Type` it named here and exactly the size it named here, both of which are signed in. It has 5 minutes. It then sends `upload_key` when saving a menu or an account, or to `PUT /api/v1/me/photo`. An upload nobody claims is deleted after 24 hours.  The worker opens the file: it must really be a JPG, PNG or WebP of at most 8000 × 8000 pixels. One that isn't is logged and deleted, and the row keeps the photo it has. 
    //
    //Future<UploadTicket> presignUpload(PresignUploadRequest presignUploadRequest) async
    test('test presignUpload', () async {
      // TODO
    });

  });
}
