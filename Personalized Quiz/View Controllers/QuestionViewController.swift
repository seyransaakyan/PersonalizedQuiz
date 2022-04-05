//
//  QuestionViewController.swift
//  Personalized Quiz
//
//  Created by Seyran Saakyan on 03.04.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressViews: UIProgressView!
    @IBOutlet weak var rangedSlider: UISlider!{
        didSet{
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.value = answerCount
        }
    }
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var multipleSwitchers: [UISwitch]!
    
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var answerChosen: [Answer] = []
    private var currentAnswers: [Answer]{
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
    }
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {return}
        let currentAnswer = currentAnswers[currentIndex]
        answerChosen.append(currentAnswer)
        newQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitchers, currentAnswers){
            if multipleSwitch.isOn{
                answerChosen.append(answer)
            }
        }
        newQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = Int(rangedSlider.value)
        answerChosen.append(currentAnswers[index])
        newQuestion()
    }
}
extension QuestionViewController{
    private func updateUI(){
        for stackView in [singleStackView, multipleStackView, rangedStackView]{
            stackView?.isHidden = true
        }
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.text
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressViews.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        showCurrentStackView(for: currentQuestion.type)
    }
    
    private func showCurrentStackView(for type: ResponseType){
        switch type{
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangedStackView(with: currentAnswers)
        }
    }
    private func showSingleStackView(with answers: [Answer]){
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers){
            button.setTitle(answer.text, for: .normal)
        }
    }
    private func showMultipleStackView(with answers: [Answer]){
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers){
            label.text = answer.text
        }
    }
    private func showRangedStackView(with answers: [Answer]){
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    private func newQuestion(){
        questionIndex += 1
        if questionIndex < questions.count{
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}

