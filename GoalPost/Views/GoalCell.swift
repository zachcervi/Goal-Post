//
//  GoalCell.swift
//  GoalPost
//
//  Created by Zach Cervi on 11/3/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    

    func configureCell(goal: Goal){
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue{
            self.completionView.isHidden = false
        }else{
            self.completionView.isHidden = true
        }
    }
}
