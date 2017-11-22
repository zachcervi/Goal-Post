//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Zach Cervi on 11/10/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import UIKit
import CoreData
class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        if pointsTextField.text != "" {
        self.save { (complete) in
            if(complete){
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
    
    func save(completition: (_ finished: Bool)-> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            completition(true)
        }catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            completition(false)
        }
    }

}
