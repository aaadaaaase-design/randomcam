import SwiftUI

struct WebcamDetailView: View {
    let cam: Webcam
    @State private var isMuted = true

    var body: some View {
        VStack(spacing: 0) {
            WebcamWebView(url: cam.embedURL, isMuted: $isMuted)

            HStack {
                Text(cam.hasAudio
                     ? "У этой камеры есть звук."
                     : "У этой камеры нет звука — источник его не передаёт.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                Spacer()

                if cam.hasAudio {
                    Button(isMuted ? "Включить звук" : "Выключить звук") {
                        isMuted.toggle()
                    }
                }
            }
            .padding()
        }
        .navigationTitle(cam.title)
    }
}
