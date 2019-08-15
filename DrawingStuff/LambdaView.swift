//
//  LambdaView.swift
//  DrawingStuff
//
//  Created by Jeffrey Santana on 8/15/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class LambdaView: UIView {
	
	let lambdaWhite = UIColor.white.cgColor
	let lambdaRed = UIColor.red.cgColor
	
	// MARK: - View Lifecycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.clear
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		backgroundColor = UIColor.clear
	}
	
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
		context.beginPath()
		context.addLines(between: [
				CGPoint(x: 0, y: 0),
				CGPoint(x: 0, y: rect.height * 0.7),
				CGPoint(x: rect.midX, y: rect.maxY),
				CGPoint(x: rect.maxX, y: rect.height * 0.7),
				CGPoint(x: rect.maxX, y: 0)
			])
		context.setFillColor(lambdaWhite)
		context.closePath()
		context.fillPath()
		
		context.beginPath()
		context.addLines(between: [
				CGPoint(x: rect.width * 0.25, y: rect.height * 0.55),
				CGPoint(x: rect.midX, y: rect.height * 0.2),
				CGPoint(x: rect.width * 0.75, y: rect.height * 0.55)
			])
		context.setLineCap(.round)
		context.setLineJoin(.bevel)
		context.setLineWidth(40)
		context.setStrokeColor(lambdaRed)
		context.strokePath()
    }

}
