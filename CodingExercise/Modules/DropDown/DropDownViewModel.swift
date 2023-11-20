//
//  DropDownViewModel.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 18/11/2023.
//

import Foundation
typealias SelectionCallBack = ((DropDownModel,Int) -> Void)

struct DropDownViewModel{
    var dropDownData : [DropDownModel]?
    var selectedData : DropDownModel?
    var selectionAction: SelectionCallBack
    
}
