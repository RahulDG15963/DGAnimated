//
//  DestinationViewController.swift
//  AnimationSample
//
//  Created by Innofied on 08/12/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit

class DestinationViewController: BaseViewController {

    @IBOutlet weak var numberOfItemLabel: DGIndexLabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        dG_indexLabel = numberOfItemLabel
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}




