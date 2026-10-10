import SwiftUI

struct ContentView: View {
    @State private var selected: Webcam?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    randomButton

                    LazyVStack(spacing: 14) {
                        ForEach(sampleWebcams) { cam in
                            WebcamCard(cam: cam) {
                                selected = cam
                            }
                        }
                    }
                }
                .padding(.horizontal, 18)
                .padding(.top, 8)
                .padding(.bottom, 24)
            }
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 0.05, green: 0.08, blue: 0.18),
                        Color(red: 0.02, green: 0.12, blue: 0.15)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
            .navigationTitle("Камеры мира")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .sheet(item: $selected) { cam in
                WebcamDetailView(cam: cam)
            }
        }
        .preferredColorScheme(.dark)
    }

    private var randomButton: some View {
        Button {
            selected = sampleWebcams.randomElement()
        } label: {
            HStack(spacing: 12) {
                Image(systemName: "dice.fill")
                    .font(.title2)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Случайная камера")
                        .font(.headline)
                    Text("Открыть любую точку мира")
                        .font(.caption)
                        .opacity(0.85)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.subheadline.weight(.semibold))
                    .opacity(0.7)
            }
            .foregroundStyle(.white)
            .padding(18)
            .background(
                LinearGradient(
                    colors: [Color(red: 0.05, green: 0.58, blue: 0.60),
                             Color(red: 0.19, green: 0.26, blue: 0.70)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .black.opacity(0.35), radius: 12, y: 6)
        }
        .buttonStyle(.plain)
    }
}

private struct WebcamCard: View {
    let cam: Webcam
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [Color.teal.opacity(0.55), Color.indigo.opacity(0.55)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 56, height: 56)
                    Text(cam.countryFlag)
                        .font(.system(size: 26))
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(cam.title)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(cam.location)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.65))
                }

                Spacer()

                Image(systemName: "play.circle.fill")
                    .font(.title)
                    .foregroundStyle(.white.opacity(0.85))
            }
            .padding(14)
            .background(.white.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .strokeBorder(.white.opacity(0.08), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}
