//
//  HomeViewController.swift
//  Tdd Sample
//
//  Created by Emincan Antalyalı on 25.10.2023.
//

import UIKit

final class HomeViewController: UIViewController {

    var articles = [Article]()

    var articleManager: ArticlesFetchable

    init(articleManager: ArticlesFetchable) {
        self.articleManager = articleManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorColor = .systemGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.layer.cornerRadius = 0
        return tableView
    }()

    override func viewDidLoad() {
        setupView()
    }

    private func setupView() {
        title = "Hey"
        view.addSubview(tableView)
        view.backgroundColor = .blue
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
    }
    func fetchData() {
        articleManager.fetchArticles { res in
            switch res {
                case .success(let success):
                    self.articles = success
                case .failure(let failure):
                   print(failure)
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
extension HomeViewController: UITableViewDelegate {

}
