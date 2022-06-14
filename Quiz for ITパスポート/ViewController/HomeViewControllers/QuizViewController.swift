//
//  QuizViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/08.
//

import UIKit
import SwiftyJSON

class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var quizCountLabel: UILabel!
    
    
    var index = 0
    
    var data: [JSON]! {
        didSet {
            for element in data {
                do {
                    let jsonRawData = try element.rawData()
                    let quiz = try JSONDecoder().decode(Quiz.self, from: jsonRawData)
                    quizArray.append(quiz)
                }
                catch {
                    print(error)
                }
            }
        }
    }
    
    var quizArray = [Quiz]()
    lazy var quiz = quizArray[index]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizTextView.text = quiz.question
        answerButton1.setTitle(quiz.options[0], for: .normal)
        answerButton2.setTitle(quiz.options[1], for: .normal)
        answerButton3.setTitle(quiz.options[2], for: .normal)
        answerButton4.setTitle(quiz.options[3], for: .normal)
        quizCountLabel.text = "\(index + 1)/\(quizArray.count)"
    }
    
    // データを送る segueで繋いでないことから使えない
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toExVC" {
//            guard let explanationData = segue.destination as? ExplanationViewController else { return }
//            let data = quiz.explanation
//            explanationData.exData = data
//        } else {
//            print("error")
//        }
//    }
//    
    
    // ボタンタップ時の動き
    @IBAction func answerButtonDidTap(_ sender:UIButton) {
        if sender.tag == quiz.answer {
            print("正解")
        } else {
            print("不正解")
        }
        let alert = ExplanationViewController()
        alert.exData = quiz.explanation
        alert.delegate = self
        alert.iscorrect = sender.tag == quiz.answer
        self.present(alert, animated: true)
    }
    
    
    func nextQuizSetUp() {
        
        quizTextView.text = quiz.question
        answerButton1.setTitle(quiz.options[0], for: .normal)
        answerButton2.setTitle(quiz.options[1], for: .normal)
        answerButton3.setTitle(quiz.options[2], for: .normal)
        answerButton4.setTitle(quiz.options[3], for: .normal)
        quizCountLabel.text = "\(index + 1)/\(quizArray.count)"
        
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

extension QuizViewController: ExplanationViewControllerDelegate {
    
    func nextButtonDidTap(_ viewController: ExplanationViewController) {
            index += 1
        if  quizArray.count > index {
            quiz = quizArray[index]
            quizTextView.text = quiz.question
            answerButton1.setTitle(quiz.options[0], for: .normal)
            answerButton2.setTitle(quiz.options[1], for: .normal)
            answerButton3.setTitle(quiz.options[2], for: .normal)
            answerButton4.setTitle(quiz.options[3], for: .normal)
            quizCountLabel.text = "\(index + 1)/\(quizArray.count)"
        } else {
            performSegue(withIdentifier: "toResultVC", sender: nil)
        }
        
    }
    
}
