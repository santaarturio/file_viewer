import UIKit

class LocalFileViewerFactory: NSObject, FlutterPlatformViewFactory {

    var messenger: FlutterBinaryMessenger?

    init(messenger: FlutterBinaryMessenger) { super.init(); self.messenger = messenger }

    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol { FlutterStandardMessageCodec.sharedInstance() }

    func create(
        withFrame frame: CGRect, 
        viewIdentifier: Int64, 
        arguments: Any?
    ) -> FlutterPlatformView {
        LocalFileViewer(
            withFrame: frame, 
            viewIdentifier: viewIdentifier, 
            arguments: arguments, 
            binaryMessenger: messenger!
        )
    }
}