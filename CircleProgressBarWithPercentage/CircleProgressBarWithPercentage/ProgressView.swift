//
//  ProgressView.swift
//  CircleProgressBarWithPercentage
//
//  Created by mk mk on 1/7/19.
//  Copyright © 2019 MC2. All rights reserved.
//

import UIKit

class ProgressView: UIView {

	// MARK: - Properties
	
	// - Variables
	// Once flag
	private var once: Bool = true
	
	
	// Progress color
	var progressColor: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) {
		didSet {
			progressLayer.strokeColor = progressColor.cgColor
		}
	}
	
	// Track color
	var trackColor: UIColor =  #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1) {
		didSet {
			tracklayer.strokeColor = trackColor.cgColor
		}
	}
	
	// Progress bar width
	public var lineWidth:CGFloat = 20.0 {
		didSet{
			progressLayer.lineWidth = lineWidth
			tracklayer.lineWidth = lineWidth
		}
	}
	
	// MARK: - Views
	lazy var percentageLabel: UILabel = {
		let lb = UILabel()
		lb.textAlignment = .center
		lb.font = UIFont.systemFont(ofSize: 40)
		return lb
	}()
	
	// Track layer
	let tracklayer = CAShapeLayer()
	
	// Progress layer
	let progressLayer = CAShapeLayer()
	
	
}


// MARK: - Public functions
extension ProgressView {
	func setProgress(value: CGFloat) {
		guard value <= 1.0 else { return }
		if once {
			setupView()
			once = false
		}
		
		progressLayer.strokeEnd = value
		
		let percentValue = value * 100.0
		percentageLabel.text = String(format: "%.0f %%", percentValue)
//		progressLayer.setNeedsDisplay()
	}
}

// MARK: - Private functions
extension ProgressView {
	func setupView() {
		let startAngle = (-CGFloat.pi) / 2
		
		// Circle path
		let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), 
									  radius: (frame.size.width - lineWidth) / 2 , 
									  startAngle: startAngle, 
									  endAngle: 2 * CGFloat.pi + startAngle, 
									  clockwise: true)
		
		// Track layer
		tracklayer.path = circlePath.cgPath
		tracklayer.fillColor = UIColor.clear.cgColor
		tracklayer.strokeColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1).cgColor
		tracklayer.lineWidth = lineWidth
		tracklayer.strokeEnd = 1.0
		layer.addSublayer(tracklayer)
		
		// Progress layer
		progressLayer.path = circlePath.cgPath
		progressLayer.fillColor = UIColor.clear.cgColor
		progressLayer.strokeColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor
		progressLayer.lineWidth = lineWidth
		progressLayer.strokeEnd = 0
		layer.addSublayer(progressLayer)
		
		// Percentage label
		percentageLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(percentageLabel)
		percentageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		percentageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
	}
}
