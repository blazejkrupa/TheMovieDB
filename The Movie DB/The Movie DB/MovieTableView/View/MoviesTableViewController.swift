//
//  MoviesTableViewController.swift
//  The Movie DB
//
//  Created by Blazej Krupa on 3/3/21.
//

import UIKit

final class MoviesTableViewController: UITableViewController {
    
    private let viewModel = MoviesViewModel()
    private lazy var moviesTableViewDelegate = MoviesTableViewDelegate(viewModel: self.viewModel)
    private lazy var moviesTableViewDataSource = MoviesTableViewDataSource(viewModel: self.viewModel)
    private lazy var moviesSearchBarDelegate = MoviesSearchBarDelegate(viewModel: self.viewModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupTableView()
        setupSearchController()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadSelectedIndexPath()
    }
    
    private func setupNavigationController() {
        navigationItem.title = Strings.movies_title.localized
    }
    
    private func setupTableView() {
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.description())
        tableView.delegate = moviesTableViewDelegate
        tableView.dataSource = moviesTableViewDataSource
        tableView.separatorStyle = .none
    }
    
    private func setupSearchController() {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = moviesSearchBarDelegate
        search.obscuresBackgroundDuringPresentation = false
        if #available(iOS 11.0, *) {
            navigationItem.searchController = search
        } else {
            tableView.tableHeaderView = search.searchBar
        }
    }
    
    private func bindViewModel() {
        viewModel.reloadTableViewCallback = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        
        viewModel.didSelectItem = { [weak self] movie in
            self?.showDetailMovieViewController(for: movie)
        }
    }
    
    private func reloadSelectedIndexPath() {
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    private func showDetailMovieViewController(for item: MovieViewModel) {
        let detail = MovieDetailViewController(viewModel: .init(movie: item))
        navigationController?.pushViewController(detail, animated: true)
    }
    
}
