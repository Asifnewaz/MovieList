//
//  MovieListViewController.swift
//  movieList
//
//  Created by USER on 5/30/22.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieListTableView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var tableViewDataSource: GenericDataSource<MovieListCell,MovieListCellVM>!
    var coordinator: MovieListVCCoordinator?
    var viewModel = MovieListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.searchbar.delegate = self
        self.viewModel.viewDidLoad(self)
        self.getMovieList()
        self.initilizedMovieListDataSource()
    }
    
    private func initilizedMovieListDataSource(){
        self.tableViewDataSource = GenericDataSource.init(cellIdentifier: "MovieListCell", items:self.viewModel.movieList, configureCell: { (cell, vm,indexpath) in
            cell.eachCell = vm
        })
        self.movieListTableView.dataSource = self.tableViewDataSource
    }
    
    
    func getMovieList() {
        self.viewModel.getMovieListData(resource: self.viewModel.CreateMovieListRequest())
    }
    
}

//MARK: UISearchBar Delegate
extension MovieListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.movieList = searchText.isEmpty ? self.viewModel.movieFilteredList : self.viewModel.movieList.filter { $0.title?.contains(searchText) ?? false }
        loadMovieListView()
    }
}


//MARK: Movie List Delegate to update tableview
extension MovieListViewController: MovieListViewModelDelegate {
    func loadMovieListView() {
        self.tableViewDataSource.updateItems(self.viewModel.movieList)
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
        }
    }
}
