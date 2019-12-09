//
//  CurrentPlaceViewController.swift
//  Jogos!
//
//  Created by Kaz Born on 28/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class CurrentPlaceViewController: BaseViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	
	@IBOutlet weak var pageOneConstraint: NSLayoutConstraint!
	@IBOutlet weak var pageTwoConstraint: NSLayoutConstraint!
	
	var player : Player!
	
	func refreshInterface () {
		collectionView.dataSource  = self
		collectionView.delegate = self
		
		if player == nil {
			player = GameManager.shared.currentPlayer
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		refreshInterface()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		refreshInterface()
	}
	
	
	private func movePagination (index: Int) {
		switch index {
		case 1:
			pageOneConstraint.priority = UILayoutPriority(rawValue: 1000)
			pageTwoConstraint.priority = UILayoutPriority(rawValue: 1)
		case 2:
			pageOneConstraint.priority = UILayoutPriority(rawValue: 1)
			pageTwoConstraint.priority = UILayoutPriority(rawValue: 1000)
		default:
			pageOneConstraint.priority = UILayoutPriority(rawValue: 1000)
			pageTwoConstraint.priority = UILayoutPriority(rawValue: 1)
		}
		
		UIView.animate(withDuration: 0.2) {
			self.view.layoutIfNeeded()
		}
	}
	
	
}

extension CurrentPlaceViewController : UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch indexPath.section {
		case 0:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageOne", for: indexPath) as! PageOneCollectionCell
			
			
			
//			cell.initialize(imageName: <#T##String#>, infoText: <#T##NSMutableAttributedString#>)
			
			return cell
		case 1:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageTwo", for: indexPath) as! PageTwoCollectionCell
			
//			cell.initialize(alignment: player.getStrAlignment(), objective: player.getStrObjective(), info: <#T##NSAttributedString#>)
			
			return cell
		default:
			print("ERROR: Switch case in collectionView in CurrentPlaceViewController")
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageOne", for: indexPath)
			
			return cell
		}
	}
	
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		
		
	}
}


extension CurrentPlaceViewController : UICollectionViewDelegate {
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		
		return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
	}
	
}


class PageOneCollectionCell : UICollectionViewCell {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var infoLabel: UILabel!
	
	func initialize (imageName: String, infoText: NSMutableAttributedString ) {
		imageView.image = UIImage(named: imageName)
		infoLabel.attributedText = infoText
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
}

class PageTwoCollectionCell : UICollectionViewCell {

	@IBOutlet weak var alignmentLabel: UILabel!
	@IBOutlet weak var objectiveLabel: UILabel!
	@IBOutlet weak var infoLabel: UILabel!
	
	func initialize (alignment: NSAttributedString, objective: NSAttributedString, info: NSAttributedString) {
		alignmentLabel.attributedText = alignment
		objectiveLabel.attributedText = objective
		infoLabel.attributedText = info
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
}
