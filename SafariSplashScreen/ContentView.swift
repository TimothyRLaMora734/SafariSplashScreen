import SwiftUI
import VisualEffects

struct ContentView: View {
//    let
    
    @State var searchText = ""
    @State var settingsPopoverIsPresented = false
    
    @State var favoritesIsOn = true
    @State var frequentlyVisitedIsOn = false
    @State var privacyReportIsOn = true
    @State var siriSuggestionsIsOn = false
    @State var readingListIsOn = false
    @State var backgroundImageIsOn = false
    
    var body: some View {
        ZStack {
            Image("safari-background-orange")
                .resizable()
                .ignoresSafeArea()
            
            content
                .shadow(color: Color.black.opacity(0.15), radius: 6, y: 2)
        }
    }
    
    var content: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    searchBar.padding()
                    if favoritesIsOn { favorites.padding() }
                    if privacyReportIsOn { privacyReport.padding() }
                    Spacer()
                }
            }
            
            toolbar
        }
    }
    
    var toolbar: some View {
        VStack {
            Spacer()
            HStack {
                Spacer().frame(width: 50)
                
                Button { settingsPopoverIsPresented.toggle() } label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.15), radius: 3, y: 2)
                }
                .buttonStyle(PlainButtonStyle())
                .popover(isPresented: $settingsPopoverIsPresented) {
                    popoverContent
                }
                
                Spacer()

                Button { } label: {
                    Image(systemName: "book")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.15), radius: 3, y: 2)
                }.buttonStyle(PlainButtonStyle())
                
                Spacer()

                Button { } label: {
                    Image(systemName: "square.on.square")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.15), radius: 3, y: 2)
                }.buttonStyle(PlainButtonStyle())
                
                Spacer().frame(width: 50)
            }
        }
    }
    
//    var popover: some View {
//
//    }
    
    var popoverContent: some View {
        VStack {
            Spacer().frame(height: 8)
            
            Toggle(isOn: $favoritesIsOn) {
                Label("Favorites", systemImage: "star")
            }.padding(4)
            
            Toggle(isOn: $frequentlyVisitedIsOn) {
                Label("Frequently Visited", systemImage: "clock")
            }.padding(4)
            
            Toggle(isOn: $privacyReportIsOn) {
                Label("Privacy Report", systemImage: "shield.lefthalf.fill")
            }.padding(4)
            
            Toggle(isOn: $siriSuggestionsIsOn) {
                Label("Siri Suggestions", systemImage: "safari")
            }.padding(4)
            
            Toggle(isOn: $readingListIsOn) {
                Label("Reading List", systemImage: "eyeglasses")
            }.padding(4)
            
            Toggle(isOn: $backgroundImageIsOn) {
                Label("Background Image", systemImage: "photo")
            }.padding(4)
            
            Spacer()
        }
        .padding()
    }
    
    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.15), radius: 3, y: 2)
            
            ZStack(alignment: .leading) {
                if searchText.isEmpty {
                    Text("Search or enter a website name")
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.15), radius: 3, y: 2)
                        .opacity(0.7)
                }
                
                TextField("", text: $searchText)
                    .foregroundColor(.white)
            }
            
            if !searchText.isEmpty {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color(.systemGray3))
                    .padding(3)
                    .onTapGesture {
                        withAnimation { self.searchText = .init() }
                    }
            }
        }
        .padding(10)
        .background(VisualEffectBlur(blurStyle: .regular))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding(.vertical, 10)
    }
    
    var favorites: some View {
        VStack(alignment: .leading) {
            Text("Favorites")
                .font(.system(size: 22, weight: .bold, design: .default))
                .foregroundColor(.white)
            
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(76), alignment: .topLeading), count: 4)) {
//                favoriteIcon(image: "apple", label: "Apple")
                favoriteIcon(image: "booooooom", label: "BOOOOOOOM")
                favoriteIcon(image: "behance", label: "Behance")
                favoriteIcon(image: "design-milk", label: "Design Milk")
                
                favoriteIcon(image: "archinect", label: "Archinect")
                favoriteIcon(image: "twitter", label: "Twitter")
                favoriteIcon(image: "wetransfer", label: "WeTransfer")
                favoriteIcon(image: "vimeo", label: "Vimeo")
            }
        }
    }
    
    func favoriteIcon(image: String, label: String) -> some View {
        Button { } label: {
            VStack(alignment: .center) {
                ZStack {
                    Color.primary.colorInvert() // E9E8E8
                    Image(image).resizable()
                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .frame(width: 76, height: 76)
                
                Text(label)
                    .foregroundColor(.white)
                    .font(.caption)
                    .bold()
                    .frame(width: 76)
                    .multilineTextAlignment(.center)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    var privacyReport: some View {
        VStack(alignment: .leading) {
            Text("Privacy Report")
                .font(.system(size: 22, weight: .bold, design: .default))
                .foregroundColor(.white)
            
            privacyReportCard
        }
    }
    
    var privacyReportCard: some View {
        ZStack {
            VisualEffectBlur(blurStyle: .regular)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "shield.lefthalf.fill")
                            .font(.system(size: 34))
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.15), radius: 3, y: 2)
                            .opacity(0.7)
                        
                        Text("20")
                            .font(.system(size: 34))
                            .shadow(color: Color.black.opacity(0.15), radius: 3, y: 2)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.15), radius: 3, y: 2)
                            .opacity(0.7)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                Spacer().frame(height: 10)
                
                // FIXME: Make this not truncate
                // Alrerady tried: lineLimit and layoutPriority
                Text("In the last seven days Safari has prevented 20 trackers from profiling you")
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.15), radius: 3, y: 2)
                    .opacity(0.7)
            }
            .padding()
            .layoutPriority(10)
        }
    }
}

extension View {
    func translucentToolbar() -> some View {
        background(TranslucentToolbar())
    }
}

public struct TranslucentToolbar: UIViewRepresentable {
    public func makeUIView(context: Context) -> UIView {
        return UIView(frame: .zero)
    }
    
    private func findToolbar(in root: UIView) -> UIToolbar? {
        for subview in root.subviews {
            if let toolbar = subview as? UIToolbar {
                return toolbar
            } else if let toolbar = findToolbar(in: subview) {
                return toolbar
            }
        }
        
        return nil
    }

    public func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            guard let viewHost = uiView.superview?.superview else {
                return
            }
            
            guard let toolbar = findToolbar(in: viewHost) else {
                return
            }
                        
            toolbar.isTranslucent = true
        }
    }
}
