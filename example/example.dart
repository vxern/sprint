import 'package:sprint/sprint.dart';

class Server {
  final Sprint log = Sprint('Server');

  // ( Just some very important server variables here :) )

  Future init() async {
    doWork();

    try {
      doErrorProneAndCrucialWork();
    } catch (exception) {
      log.error('Failed to initialise server');
      return;
    }

    log.info('Initialised server');
  }
}

void doWork() {}
void doErrorProneAndCrucialWork() {}

void main() {}
