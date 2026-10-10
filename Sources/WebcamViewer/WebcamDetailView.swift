import SwiftUI

struct WebcamDetailView: View {
    let cam: Webcam
    @Environment(\.dismiss) private var dismiss
    @State private var isMuted = true
    @State private var isLoading = true

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            WebcamWebView(url: cam.embedURL, isMuted: $isMuted, isLoading: $isLoading)
                .ignoresSafeArea(edges: .bottom)

            if isLoading {
                ProgressView()
                    .tint(.white)
                    .scaleEffect(1.3)
            }

            VStack {
                topBar
                Spacer()
                bottomBar
            }
        }
        .statusBarHidden(false)
        .preferredColorScheme(.dark)
    }

    private var topBar: some View {
        HStack {
            Text(cam.countryFlag)
                .font(.title2)
            VStack(alignment: .leading, spacing: 1) {
                Text(cam.title)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white)
                Text(cam.location)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.subheadline.weight(.bold))
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(.white.opacity(0.15), in: Circle())
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 10)
        .background(.black.opacity(0.55))
    }

    private var bottomBar: some View {
        HStack {
            Label(
                cam.hasAudio ? "Звук доступен" : "У источника нет звука",
                systemImage: cam.hasAudio ? "speaker.wave.2.fill" : "speaker.slash.fill"
            )
            .font(.caption)
            .foregroundStyle(.white.opacity(0.75))

            Spacer()

            if cam.hasAudio {
                Button {
                    isMuted.toggle()
                } label: {
                    Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.white.opacity(0.15), in: Circle())
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(.black.opacity(0.55))
    }
}
