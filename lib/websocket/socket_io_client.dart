import 'package:socket_io_client/socket_io_client.dart';

class SocketIOClient {
  Socket? socket;

  void connect(String uri) {
    socket = io(
        uri,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket?.connect();
    socket?.onConnect((data) {
      print("connect:$data");
    });
    socket?.onConnecting((data) {
      print("connecting:$data");
    });
    socket?.onDisconnect((data) {
      print("disconnect:$data");
    });
    socket?.onConnectError((data) {
      print("connectError:$data");
    });
    socket?.onError((data) {
      print("Error:$data");
    });
    socket?.onPing((data) {
      print("ping:$data");
    });
    socket?.onPong((data) {
      print("pong:$data");
    });

    socket?.on('event', (data) {
      print("event:$data");
    });

    socket?.on('my_event', (data) {
      print(">>my_event:$data");
    });
    socket?.on('my_response', (data) {
      print(">>my_response:$data");
    });
  }

  void sendMsg(List args) {
    print("args changeActivity:$args");
    socket?.send(args);
    socket?.on('changeActivity', (data) {
      print("changeActivity:$data");
    });
  }

  void emit(String event, dynamic args) {
    print(">>emit:$event:$args");
    socket?.emit(event, args);
    socket?.on(event, (data) {
      print("emit:$event:$data");
    });
  }

  void emitWithAck(String event, dynamic args) {
    print(">>emitWithAck:$event:$args");
    socket?.emitWithAck(event, args, ack: (data) {
      print('ack $data');
      if (data != null) {
        print('from server $data');
      } else {
        print("Null");
      }
    });
    socket?.on(event, (data) {
      print("emit:$event:$data");
    });
  }

  void packet(event, Map packet) {
    print("packet:$event:$packet");
    socket?.packet(packet);
    socket?.on(event, (data) {
      print("packet:$event:$data");
    });
  }

  void disConnect() {
    socket?.disconnect();
  }
}
