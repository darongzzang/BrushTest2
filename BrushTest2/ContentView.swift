//
//  ContentView.swift
//  BrushTest2
//
//  Created by 김이예은 on 9/25/24.
//

import SwiftUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .black
    var lineWidth: Double = 5.0
}

struct ContentView: View {
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .black
    @State private var thickness: Double = 0.0
    
    var body: some View{
        VStack {
            ZStack {
                Image("mask")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Canvas { context, size in
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                    }
                    
                }.background(Color.clear)
                    .frame(minWidth: 400, minHeight: 400)
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged({ value in
                            let newPoint = value.location
                            currentLine.points.append(newPoint)
                            self.lines.append(currentLine)
                        })
                            .onEnded({ value in
                                self.currentLine = Line(points: [], color: selectedColor, lineWidth: thickness)
                            })
                    )
            }
            
            Slider(value: $thickness, in: 1...20) {
                Text("Thickness")
            }.frame(maxWidth: 200)
                .onChange(of: thickness) { newThickness in
                    currentLine.lineWidth = newThickness
                }
            
            Divider()
            
            ColorPickerView(selectedColor: $selectedColor)
                .onChange(of: selectedColor) { newColor in
                    currentLine.color = newColor
                }
        }
    }
}

#Preview {
    ContentView()
}
