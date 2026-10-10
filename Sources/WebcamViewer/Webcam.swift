import Foundation

struct Webcam: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let embedURL: URL
    /// Most public traffic/tourism webcams do NOT carry audio at all (no mic,
    /// or audio stripped for legal/bandwidth reasons). Only mark this true if
    /// you've personally confirmed the page actually plays sound.
    let hasAudio: Bool
}

/// Starter list — edit freely. Add any public webcam page URL here; the app
/// just loads it in a web view, so anything that works in mobile Safari works.
let sampleWebcams: [Webcam] = [
    Webcam(
        title: "Times Square",
        location: "New York, USA",
        embedURL: URL(string: "https://www.earthcam.com/usa/newyork/timessquare/?cam=tsstreet")!,
        hasAudio: false
    ),
    Webcam(
        title: "Abbey Road Crossing",
        location: "London, UK",
        embedURL: URL(string: "https://www.abbeyroad.com/crossing")!,
        hasAudio: false
    ),
    Webcam(
        title: "Grand Canal",
        location: "Venice, Italy",
        embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/italia/veneto/venezia/canal-grande-rialto.html")!,
        hasAudio: false
    ),
    Webcam(
        title: "Dubai Marina",
        location: "Dubai, UAE",
        embedURL: URL(string: "https://www.skylinewebcams.com/en/webcam/united-arab-emirates/dubai/dubai/dubai-marina.html")!,
        hasAudio: false
    ),
]
