//
//  ViewController.swift
//  APSkewed2

import UIKit
struct cellData {
    var image: String
    var text: String
}
class ViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!

    let cellIdentifier = "cell"
    var data = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        fillData()
        collectionView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    func fillData() {
        data.append(cellData(image: "1.png", text: "DESERT" ))
        data.append(cellData(image: "2.png", text: "MOUNTAIN" ))
        data.append(cellData(image: "3.png", text: "BLAH\n warm" ))
        data.append(cellData(image: "4.png", text: "SUNSET\n red" ))
        data.append(cellData(image: "5.png", text: "AJACCIO\n beach" ))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! APSkewedCell
        cell.image.image = UIImage(named: data[indexPath.row].image)
        cell.label.text = data[indexPath.row].text
        cell.updateParallaxOffset(collectionViewBounds: collectionView.bounds)
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cells = collectionView.visibleCells as! [APSkewedCell]
        let bounds = collectionView.bounds
        for cell in cells{
            cell.updateParallaxOffset(collectionViewBounds: bounds)
        }
    }
}


