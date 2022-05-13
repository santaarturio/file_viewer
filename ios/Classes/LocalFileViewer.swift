import UIKit
import WebKit

class LocalFileViewer: NSObject, FlutterPlatformView {

    static var onLoadingFinished: ((Bool) -> Void)?
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
        webView?.navigationDelegate = self
        webView?.load(URLRequest(url: URL(fileURLWithPath: arguments["filePath"]!)))
    }

    func view() -> UIView { webView! }
}

// MARK: - WKNavigationDelegate
extension LocalFileViewer: WKNavigationDelegate {

    func webView(
        _ webView: WKWebView,
        didFinish navigation: WKNavigation!
    ) { 
        LocalFileViewer.onLoadingFinished?(false)
        LocalFileViewer.onLoadingFinished = nil
    }
}