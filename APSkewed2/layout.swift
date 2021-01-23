//
//  layout.swift
//  APSkewed2

import UIKit
func DegreesToRadian(degrees: Double) -> CGFloat {
    return CGFloat((.pi * degrees) / 180)
}
class layout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttribute = super.layoutAttributesForElements(in: rect) as! [UICollectionViewLayoutAttributes]
        for attribute in layoutAttribute{
            attribute.frame = attribute.frame.insetBy(dx: 0, dy: 0)
            attribute.size = CGSize(width: 1.1 * (collectionView?.bounds.width)!, height: 165)
            attribute.transform = CGAffineTransform(rotationAngle: -0.1)
        }
        return layoutAttribute
    }
}
