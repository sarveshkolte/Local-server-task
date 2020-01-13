import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:angel_jael/angel_jael.dart';
import 'package:file/local.dart';
import 'package:angel_configuration/angel_configuration.dart';


main() async{
  var app = Angel();
  var http = AngelHttp(app);
  var fs = LocalFileSystem();

  await app.configure(configuration(fs));
  await app.configure(jael(fs.directory('views')));

  await app.get('/', (req, res) async{
    await res.render('index', {'title':'Home'});
  });

  http.startServer('localhost', 8080);
}
