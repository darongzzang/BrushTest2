////
////  ImageRenderer.swift
////  BrushTest2
////
////  Created by 김이예은 on 9/25/24.
////
//
//import SwiftUI
//
//struct ImageRenderer: UIViewRepresentable {
//    var lines: [Line]
//    var backgroundImage: UIImage
//    
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView()
//        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
//        
//        view.backgroundColor = .clear
//        
//        let image = renderer.image { context in
//            // 배경 이미지 그리기
//            backgroundImage.draw(in: CGRect(origin: .zero, size: view.bounds.size))
//            
//            // 드로잉 선 그리기
//            for line in lines {
//                context.cgContext.setStrokeColor(line.color.cgColor)
//                context.cgContext.setLineWidth(line.lineWidth)
//                context.cgContext.addLines(between: line.points)
//                context.cgContext.strokePath()
//            }
//        }
//        
//        // 결과 이미지를 UIImageView에 설정
//        let imageView = UIImageView(image: image)
//        imageView.frame = view.bounds
//        imageView.contentMode = .scaleAspectFit
//        view.addSubview(imageView)
//        
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIView, context: Context) {}
//}
//
