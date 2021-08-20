import 'package:sprint/sprint.dart';

class Server {
  final Sprint log = Sprint('Server');

  Future init() async {
    doWork();

    try {
      doCrucialButErrorProneWork();
    } on Exception catch (exception) {
      return log.fatal('Failed to initialise server: $exception');
    }

    log.info('Initialised server');
  }

  void doWork() {}
  void doCrucialButErrorProneWork() {}
}
