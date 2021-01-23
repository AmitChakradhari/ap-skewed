//
//  APSkewedCellCollectionViewCell.swift
//  APSkewed2

import UIKit

class APSkewedCell: UICollectionViewCell {
    

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    var parallaxOffset:CGFloat = 0 {
        didSet{
            centerYConstraint.constant = parallaxOffset
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
    }
    func updateParallaxOffset(collectionViewBounds bounds:CGRect) {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let offsetFromCenter = CGPoint(x: center.x - self.center.x, y: center.y - self.center.y)
        let maxVerticalOffset = bounds.height  + self.bounds.height
        let scaleFactor = 100 / maxVerticalOffset
        parallaxOffset = offsetFromCenter.y * scaleFactor
    }
}
