import SwiftUI

struct ContentView: View {
    @State private var selected: Webcam?

    var body: some View {
        NavigationStack {
            List(sampleWebcams) { cam in
                Button {
                    selected = cam
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(cam.title)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text(cam.location)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Публичные камеры")
            .sheet(item: $selected) { cam in
                WebcamDetailView(cam: cam)
            }
        }
    }
}
