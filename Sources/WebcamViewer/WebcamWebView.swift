import SwiftUI
import WebKit

struct WebcamWebView: UIViewRepresentable {
    let url: URL
    @Binding var isMuted: Bool
    @Binding var isLoading: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        // Best-effort: hide the host site's own header/nav/footer/cookie
        // banners so it reads as a camera viewer rather than a website.
        // Harmless if the page doesn't match any of these selectors.
        let css = """
        header, nav, footer, .header, .footer, .navbar, .cookie, .cookies,
        .cookie-banner, .consent, #onetrust-consent-sdk, .ads, .advert,
        .advertisement, .cc-window { display: none !important; }
        body { margin: 0 !important; background: #000 !important; }
        video, img { max-width: 100% !important; }
        """
        let cssScript = """
        var style = document.createElement('style');
        style.innerHTML = `\(css)`;
        document.head.appendChild(style);
        """
        let userScript = WKUserScript(source: cssScript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        config.userContentController.addUserScript(userScript)

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        webView.scrollView.bounces = false
        webView.isOpaque = false
        webView.backgroundColor = .black
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let muted = isMuted ? "true" : "false"
        let js = "document.querySelectorAll('video,audio').forEach(function(e){ e.muted = \(muted); });"
        webView.evaluateJavaScript(js, completionHandler: nil)
    }

    final class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebcamWebView
        private let allowedHost: String?

        init(_ parent: WebcamWebView) {
            self.parent = parent
            self.allowedHost = parent.url.host
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            DispatchQueue.main.async { self.parent.isLoading = true }
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.async { self.parent.isLoading = false }
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            DispatchQueue.main.async { self.parent.isLoading = false }
        }

        // Keep the viewer on the camera page: block taps that would
        // navigate to a different site (ads, "visit our homepage", etc).
        // Same-host navigation (e.g. switching camera angle) stays allowed.
        func webView(_ webView: WKWebView,
                     decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let host = navigationAction.request.url?.host else {
                decisionHandler(.allow)
                return
            }
            if navigationAction.targetFrame == nil {
                // Links that try to open a new tab/window: block.
                decisionHandler(.cancel)
                return
            }
            if let allowedHost, host != allowedHost, host.hasSuffix(allowedHost) == false,
               allowedHost.hasSuffix(host) == false {
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }
    }
}
