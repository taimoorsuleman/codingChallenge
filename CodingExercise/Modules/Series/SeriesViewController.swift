//
//  SeriesViewController.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import UIKit

class SeriesViewController: UIViewController {
    
    //MARK: - Iboutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables
    var viewModel: SeriesViewModelPresentable?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindData()
        performRequests()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: .episodeTableViewCell, bundle: nil), forCellReuseIdentifier: .episodeTableViewCell)
        tableView.register(UINib(nibName: .seriesHeaderTableViewCell, bundle: nil), forCellReuseIdentifier: .seriesHeaderTableViewCell)

    }
    
    func performRequests()  {
        self.startActivityIndicator()
        let seriesID = "62852"
        viewModel?.fetchSeriesData(seriesID: seriesID)
    }
    
    
    @objc func openDropdown(){
        let dropDownViewModel = DropDownViewModel(dropDownData: viewModel?.getDropDownData(),selectedData: viewModel?.getSelectedDropDown(),selectionAction: { (seasonData,index) in
            self.viewModel?.selectedSeasonIndex = index
            self.viewModel?.fetchSeasonData(seasonID: seasonData.id)
        })
        
        Utils.openAlertVC(viewController: self, alertModel:dropDownViewModel)
    }
    

}
//MARK: - UITableView Datasource, Delegate
extension SeriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = self.tableView.dequeueReusableCell(withIdentifier: .seriesHeaderTableViewCell) as! SeriesHeaderTableViewCell
            if let sereisData = viewModel?.getSeriesModel(){
                cell.setupData(data: sereisData)
            }
            cell.delegate = self
            cell.selectedSeasonBtn.setTitle("  \(viewModel?.getSelectedDropDown()?.title ?? .emptyString)", for: .normal)
            cell.selectedSeasonBtn.addTarget(self, action: #selector(openDropdown), for: .touchUpInside)
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .episodeTableViewCell, for: indexPath) as? EpisodeTableViewCell{
            
            if let model = viewModel?.getEpisodeModel(for: indexPath.row - 1){
                cell.populateUI(title: model.name ?? .emptyString, imgPath: model.stillPath ?? .emptyString)
            }
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let seasonsCount = viewModel?.numberOfSeasons() ?? 0
        if seasonsCount == 0 {
            return 0
        }
        return seasonsCount + 1
    }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: - Binding Data
extension SeriesViewController {
    
    func bindData() {
        
        viewModel?.reloadTableViewData = { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.stopActivityIndicator()
                self.tableView.reloadData()
            }
        }
        
        viewModel?.stopActivityIndicator = { [weak self] in
            guard let self = self else { return }
            self.stopActivityIndicator()
        }
        
    }
}


extension SeriesViewController : SeriesHeaderTableViewCellDelegate{
    func onReadMoretap() {
        self.tableView.reloadData()
    }
    
    
}
