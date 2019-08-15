//
//  PokeballView.swift
//  DrawingStuff
//
//  Created by Jeffrey Santana on 8/15/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

@IBDesignable
class PokeballView: UIView {
	
	let pokeTopColor = UIColor.red.cgColor
	let pokeBottomColor = UIColor.white.cgColor
	let borderColor = UIColor.black.cgColor
	let borderWith: CGFloat = 20
	let buttonSize:CGFloat = 125
	
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
		let pokeCenter = CGPoint(x: rect.midX, y: rect.midY)
		let pokeRadius = rect.height / 2
		
		//Ball -top
		context.addArc(center: pokeCenter, radius: pokeRadius, startAngle: 0, endAngle: .pi, clockwise: true)
		context.setFillColor(pokeTopColor)
		context.fillPath()
		
		//Ball -bottom
		context.addArc(center: pokeCenter, radius: pokeRadius, startAngle: 0, endAngle: .pi, clockwise: false)
		context.setFillColor(pokeBottomColor)
		context.fillPath()
		
		//Border
		let strokeRect = CGRect(x: rect.origin.x + borderWith/2,
								y: rect.origin.y + borderWith/2,
								width: rect.width - borderWith,
								height: rect.height - borderWith)
		context.addEllipse(in: strokeRect)
		context.setLineWidth(borderWith)
		context.setStrokeColor(borderColor)
		context.strokePath()
		
		//Divider
		context.beginPath()
		context.move(to: CGPoint(x: 0, y: rect.midY))
		context.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
		context.setStrokeColor(borderColor)
		context.setLineWidth(borderWith)
		context.strokePath()
		
		//Button
		let buttonOrigin = CGPoint(x: pokeCenter.x - buttonSize / 2,
								   y: pokeCenter.y - buttonSize / 2)
		
		context.addEllipse(in: CGRect(x: buttonOrigin.x,
									  y: buttonOrigin.y,
									  width: buttonSize,
									  height: buttonSize))
		context.setFillColor(pokeBottomColor)
		context.fillPath()
		
		//Button border
		let buttonBorder = CGRect(x: buttonOrigin.x + borderWith/2,
								y: buttonOrigin.y + borderWith/2,
								width: buttonSize - borderWith,
								height: buttonSize - borderWith)
		context.addEllipse(in: buttonBorder)
		context.setLineWidth(borderWith)
		context.setStrokeColor(borderColor)
		context.strokePath()
		
	}
}
