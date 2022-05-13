import Flutter
import UIKit

let channelName = "file_viewer.channel.name"
let viewName = "file_viewer.view.name"

public class SwiftFileViewerPlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())
    let instance = SwiftFileViewerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    registrar.register(LocalFileViewerFactory(messenger: registrar.messenger()), withId: viewName)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
      case "getLoadingState":
        LocalFileViewer.onLoadingFinished = result
      default:
        result(FlutterMethodNotImplemented)
    }
  }
}
