//
//  ViewController.swift
//  AnimationSample
//
//  Created by Innofied on 21/09/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
//    <a href="https://imgbb.com/"><img src="https://image.ibb.co/gOdfLG/154507_004_2_B9437_A3.jpg" alt="154507_004_2_B9437_A3" border="0"></a>
//    <a href="https://ibb.co/gwhwub"><img src="https://preview.ibb.co/f2gBSw/Kanada_British_Columbia_Wells_Gray_Provincial_Park_Helmcken_Fall1.jpg" alt="Kanada_British_Columbia_Wells_Gray_Provincial_Park_Helmcken_Fall1" border="0"></a>
//    <a href="https://imgbb.com/"><img src="https://image.ibb.co/kObpEb/44084_004_EC0_D29_EA.jpg" alt="44084_004_EC0_D29_EA" border="0"></a>
//    <a href="https://imgbb.com/"><img src="https://image.ibb.co/gu9LLG/33568f27a9ee9b790d0a5af9cfc44fe8_paintings_of_nature_mountain_paintings.jpg" alt="33568f27a9ee9b790d0a5af9cfc44fe8_paintings_of_nature_mountain_paintings" border="0"></a>
//    <a href="https://ibb.co/mXCCZb"><img src="https://preview.ibb.co/jqAzEb/Highland_Song_High_Res.jpg" alt="Highland_Song_High_Res" border="0"></a>
//    <a href="https://ibb.co/iw49Eb"><img src="https://preview.ibb.co/gWBZfG/drawn_mountain_fall_landscape_2.jpg" alt="drawn_mountain_fall_landscape_2" border="0"></a>
    let items = ["https://image.ibb.co/gOdfLG/154507_004_2_B9437_A3.jpg","https://preview.ibb.co/f2gBSw/Kanada_British_Columbia_Wells_Gray_Provincial_Park_Helmcken_Fall1.jpg","https://image.ibb.co/kObpEb/44084_004_EC0_D29_EA.jpg","https://image.ibb.co/gu9LLG/33568f27a9ee9b790d0a5af9cfc44fe8_paintings_of_nature_mountain_paintings.jpg","https://preview.ibb.co/jqAzEb/Highland_Song_High_Res.jpg"]
    var cell: UICollectionViewCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let urlString = items[indexPath.row]
        cell.imageView.sd_setImage(with: URL.init(string: urlString), placeholderImage: #imageLiteral(resourceName: "dg_gallery_placeholder"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BaseViewController()
        cell = collectionView.cellForItem(at: indexPath)
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        vc.dG_imageArray = items
        vc.dG_index = indexPath.row
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)

        }
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimateTransition(withDuration: 0.5, forTransitionType: .Dismissing, originFrame: (self.cell?.frame)!, collectionView: collectionView)
    }
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? { 
        return AnimateTransition(withDuration: 0.5, forTransitionType: .Presenting, originFrame: (self.cell?.frame)!, collectionView: collectionView)
    }
}
