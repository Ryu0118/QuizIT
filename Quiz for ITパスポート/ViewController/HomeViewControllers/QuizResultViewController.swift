//
//  QuizResultViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/03.
//

import UIKit

class QuizResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapTopButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?
            .presentingViewController?
            .dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
