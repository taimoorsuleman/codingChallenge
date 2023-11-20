//
//  DropDownViewController.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 17/11/2023.
//

import UIKit

class DropDownViewController: UIViewController {

    var viewModel: DropDownViewModel?
    private var selectedIndex :Int?
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if let selectedData = viewModel?.selectedData{
            self.selectedIndex = viewModel?.dropDownData?.firstIndex(where: {$0 == selectedData})
        }
    }
    
    @IBAction func crossBtnAction(_ sender: Any) {
        self.dismiss(animated: true)
    }

}

//MARK: - UITableview Delegate, Datasource

extension DropDownViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .dropDownTableViewCell, for: indexPath) as! DropDownTableViewCell
        cell.titleLbl.text = viewModel?.dropDownData?[indexPath.row].title
        cell.isSelected = (indexPath.row == selectedIndex)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = viewModel?.dropDownData?[indexPath.row] {
            viewModel?.selectionAction(data, indexPath.row)
        }
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.dropDownData?.count ?? 0
    }
}
