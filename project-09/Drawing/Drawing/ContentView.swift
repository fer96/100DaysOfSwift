//
//  ContentView.swift
//  Drawing
//
//  Created by Fernando De La Rosa on 01/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct Trapezoid: Shape {
	var insetAmount: CGFloat
	
	var animatableData: CGFloat {
		get { insetAmount }
		set { self.insetAmount = newValue }
	}

	func path(in rect: CGRect) -> Path {
		var path = Path()

		path.move(to: CGPoint(x: 0, y: rect.maxY))
		path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x: 0, y: rect.maxY))

		return path
	}
}

struct Checkerboard: Shape {
	var rows: Int
	var columns: Int
	
	public var animatableData: AnimatablePair<Double, Double> {
		get {
			AnimatablePair(Double(rows), Double(columns))
		}

		set {
			self.rows = Int(newValue.first)
			self.columns = Int(newValue.second)
		}
	}

	func path(in rect: CGRect) -> Path {
		var path = Path()

		// figure out how big each row/column needs to be
		let rowSize = rect.height / CGFloat(rows)
		let columnSize = rect.width / CGFloat(columns)

		// loop over all rows and columns, making alternating squares colored
		for row in 0..<rows {
			for column in 0..<columns {
				if (row + column).isMultiple(of: 2) {
					// this square should be colored; add a rectangle here
					let startX = columnSize * CGFloat(column)
					let startY = rowSize * CGFloat(row)

					let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
					path.addRect(rect)
				}
			}
		}

		return path
	}
}

// MARK: - Challenge

/*
Draw an arrow in a square
*/
struct Arrow: Shape {
	var insetAmount: CGFloat
	
	var animatableData: CGFloat {
			get { insetAmount }
			set { self.insetAmount = newValue }
	}
	
	func path(in rect: CGRect) -> Path {
		let center = CGPoint(x: rect.midX, y: rect.midY)
		let half = insetAmount * 0.5
		let quarter = half * 0.5
		let eighth = quarter * 0.5
		
		var path = Path()
		
		/// Point
		path.move(to: CGPoint(x: center.x, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - rect.midY * half))
		path.addLine(to: CGPoint(x: center.x, y: rect.maxY - rect.midY * quarter))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - rect.midY * half))
		path.addLine(to: CGPoint(x: center.x, y: rect.maxY))
		
		/// Line
		path.addLine(to: CGPoint(x: center.x - rect.midX * eighth, y: rect.maxY - rect.midY * quarter))
		path.addLine(to: CGPoint(x: center.x - rect.midX * eighth, y: rect.midY))
		path.addLine(to: CGPoint(x: center.x + rect.midX * eighth, y: rect.midY))
		path.addLine(to: CGPoint(x: center.x + rect.midX * eighth, y: rect.maxY - rect.midY * quarter))
		
		return path
	}
}

struct ContentView: View {
	@State private var inset: CGFloat = 1.0
	
	var body: some View {
		VStack {
			/// Arrow
			Arrow(insetAmount: inset)
				//.frame(width: 300, height: 300)
			
			/// Slider
			Slider(value: $inset, in: 1...4, step: 0.1)
				.padding([.horizontal, .bottom])
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
