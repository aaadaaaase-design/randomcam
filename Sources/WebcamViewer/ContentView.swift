import SwiftUI

struct ContentView: View {
    @State private var selected: Webcam?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 22) {
                    randomButton

                    LazyVStack(spacing: 16) {
                        ForEach(sampleWebcams) { cam in
                            // Single tap: opens straight into the live view,
                            // no extra confirmation step.
                            WebcamCard(cam: cam) {
                                selected = cam
                            }
                        }
                    }
                }
                .padding(.horizontal, 18)
                .padding(.top, 10)
                .padding(.bottom, 32)
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
            // Single tap on the sheet's trigger opens the live camera
            // immediately — no intermediate screen.
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
            HStack(spacing: 14) {
                Image(systemName: "dice.fill")
                    .font(.system(size: 30))
                VStack(alignment: .leading, spacing: 3) {
                    Text("Случайная камера")
                        .font(.title3.weight(.semibold))
                    Text("Открыть любую точку из \(sampleWebcams.count)")
                        .font(.subheadline)
                        .opacity(0.85)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.headline)
                    .opacity(0.7)
            }
            .foregroundStyle(.white)
            .padding(22)
            .background(
                LinearGradient(
                    colors: [Color(red: 0.05, green: 0.58, blue: 0.60),
                             Color(red: 0.19, green: 0.26, blue: 0.70)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: .black.opacity(0.35), radius: 14, y: 8)
        }
        .buttonStyle(.plain)
    }
}

private struct WebcamCard: View {
    let cam: Webcam
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [Color.teal.opacity(0.55), Color.indigo.opacity(0.55)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 68, height: 68)
                    Text(cam.countryFlag)
                        .font(.system(size: 32))
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(cam.title)
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(.white)
                    Text(cam.location)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.65))
                }

                Spacer()

                Image(systemName: "play.circle.fill")
                    .font(.system(size: 34))
                    .foregroundStyle(.white.opacity(0.85))
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(.white.opacity(0.08), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}
