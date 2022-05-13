import UIKit
import WebKit

class LocalFileViewer: NSObject, FlutterPlatformView {

    private var webView: WKWebView?

    init(
        withFrame frame: CGRect, 
        viewIdentifier viewID: Int64, 
        arguments: Any?, 
        binaryMessenger messenger: FlutterBinaryMessenger
    ) {
        super.init()
        let arguments = arguments as! [String: String]
        
        webView = WKWebView(frame: frame)
        webView?.load(URLRequest(url: URL(fileURLWithPath: arguments["filePath"]!)))
    }

    func view() -> UIView { webView! }
}