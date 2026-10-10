import SwiftUI
import WebKit

struct WebcamWebView: UIViewRepresentable {
    let url: URL
    @Binding var isMuted: Bool

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        // Best-effort: mute/unmute any <video>/<audio> elements the page
        // happens to contain. Does nothing if the page has none (most
        // public webcams), which is expected and not an error.
        let muted = isMuted ? "true" : "false"
        let js = "document.querySelectorAll('video,audio').forEach(function(e){ e.muted = \(muted); });"
        webView.evaluateJavaScript(js, completionHandler: nil)
    }
}
