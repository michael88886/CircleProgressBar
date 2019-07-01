//
//  ViewController.swift
//  CircleProgressBarWithPercentage
//
//  Created by mk mk on 1/7/19.
//  Copyright © 2019 MC2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Properties
	// - Constants
	private let progressSize: CGFloat = 200
	
	// MARK: - View
	// Progress view
	lazy var progressView = ProgressView()
	
	
	// MARK: - Override functions
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		// Call in view did appear, due to progress view will have its certain size
		// MARK: - Change value for test ‼️
		progressView.setProgress(value: 0.23)
	}
	
	override func loadView() {
		super.loadView()
		
		progressView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(progressView)
		progressView.widthAnchor.constraint(equalToConstant: progressSize).isActive = true
		progressView.heightAnchor.constraint(equalToConstant: progressSize).isActive = true
		progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
	
}

