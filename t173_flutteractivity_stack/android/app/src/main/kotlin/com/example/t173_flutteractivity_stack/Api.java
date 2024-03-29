// Autogenerated from Pigeon (v0.1.6), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.example.t173_flutteractivity_stack;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import java.util.ArrayList;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings("unused")
public class Api {

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface AndroidApi {
    void startAnotherFlutter();

    /** Sets up an instance of `AndroidApi` to handle messages through the `binaryMessenger` */
    static void setup(BinaryMessenger binaryMessenger, AndroidApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.AndroidApi.startAnotherFlutter", new StandardMessageCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            HashMap<String, HashMap> wrapped = new HashMap<>();
            try {
              api.startAnotherFlutter();
              wrapped.put("result", null);
            }
            catch (Exception exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static HashMap wrapError(Exception exception) {
    HashMap<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", null);
    errorMap.put("details", null);
    return errorMap;
  }
}
