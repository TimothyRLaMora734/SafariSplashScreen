import SwiftUI

// This is for building my own popover.
//
// I need to figure out how to anchor the "tail" of the popover to the button which
// pressed it and stumbled down this rabbit hole:
// https://stackoverflow.com/questions/58325063/swiftui-how-to-get-coordinate-position-of-clicked-button
// https://swiftui-lab.com/communicating-with-the-view-tree-part-2/

// Once I know the position, I can position the tail in the ZStack using `offset`:
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-adjust-the-position-of-a-view-using-its-offset

//struct MyTextPreferenceData {
//    let viewIdx: Int
//    var topLeading: Anchor<CGPoint>? = nil
//    var bottomTrailing: Anchor<CGPoint>? = nil
//}
//
//struct MyTextPreferenceKey: PreferenceKey {
//    typealias Value = [MyTextPreferenceData]
//
//    static var defaultValue: [MyTextPreferenceData] = []
//
//    static func reduce(value: inout [MyTextPreferenceData], nextValue: () -> [MyTextPreferenceData]) {
//        value.append(contentsOf: nextValue())
//    }
//}
//
//struct MonthView: View {
//    @Binding var activeMonth: Int
//    let label: String
//    let idx: Int
//
//    var body: some View {
//        Text(label)
//            .padding(10)
//            .anchorPreference(key: MyTextPreferenceKey.self, value: .topLeading, transform: { [MyTextPreferenceData(viewIdx: self.idx, topLeading: $0)] })
//            .transformAnchorPreference(key: MyTextPreferenceKey.self, value: .bottomTrailing, transform: { ( value: inout [MyTextPreferenceData], anchor: Anchor<CGPoint>) in
//                value[0].bottomTrailing = anchor
//            })
//
//            .onTapGesture { self.activeMonth = self.idx }
//    }
//}
//
//struct ContentView : View {
//    @State private var activeIdx: Int = 0
//
//    var body: some View {
//        VStack {
//            Spacer()
//
//            HStack {
//                MonthView(activeMonth: $activeIdx, label: "January", idx: 0)
//                MonthView(activeMonth: $activeIdx, label: "February", idx: 1)
//                MonthView(activeMonth: $activeIdx, label: "March", idx: 2)
//                MonthView(activeMonth: $activeIdx, label: "April", idx: 3)
//            }
//
//            Spacer()
//
//            HStack {
//                MonthView(activeMonth: $activeIdx, label: "May", idx: 4)
//                MonthView(activeMonth: $activeIdx, label: "June", idx: 5)
//                MonthView(activeMonth: $activeIdx, label: "July", idx: 6)
//                MonthView(activeMonth: $activeIdx, label: "August", idx: 7)
//            }
//
//            Spacer()
//
//            HStack {
//                MonthView(activeMonth: $activeIdx, label: "September", idx: 8)
//                MonthView(activeMonth: $activeIdx, label: "October", idx: 9)
//                MonthView(activeMonth: $activeIdx, label: "November", idx: 10)
//                MonthView(activeMonth: $activeIdx, label: "December", idx: 11)
//            }
//
//            Spacer()
//        }.backgroundPreferenceValue(MyTextPreferenceKey.self) { preferences in
//            GeometryReader { geometry in
//                self.createBorder(geometry, preferences)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//            }
//        }
//    }
//
//    func createBorder(_ geometry: GeometryProxy, _ preferences: [MyTextPreferenceData]) -> some View {
//        let p = preferences.first(where: { $0.viewIdx == self.activeIdx })
//
//        let aTopLeading = p?.topLeading
//        let aBottomTrailing = p?.bottomTrailing
//
//        let topLeading = aTopLeading != nil ? geometry[aTopLeading!] : .zero
//        let bottomTrailing = aBottomTrailing != nil ? geometry[aBottomTrailing!] : .zero
//
//
//        return RoundedRectangle(cornerRadius: 15)
//            .stroke(lineWidth: 3.0)
//            .foregroundColor(Color.green)
//            .frame(width: bottomTrailing.x - topLeading.x, height: bottomTrailing.y - topLeading.y)
//            .fixedSize()
//            .offset(x: topLeading.x, y: topLeading.y)
//            .animation(.easeInOut(duration: 1.0))
//    }
//}
