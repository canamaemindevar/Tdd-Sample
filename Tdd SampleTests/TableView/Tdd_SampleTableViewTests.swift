//
//  Tdd_SampleTests.swift
//  Tdd SampleTests
//
//  Created by Emincan Antalyalı on 25.10.2023.
//

import XCTest
@testable import Tdd_Sample

// RED -> GREEN -> REFACTOR
final class Tdd_SampleTableViewTests: XCTestCase {

    var sut = HomeViewController(articleManager: MockRepository())

    func createArticleWithCount(num: Int) -> [Article] {
     var newArticles = [Article]()
        for _ in 0..<num {
            let artic = Article(author: "Me", content: "Nothing")
            newArticles.append(artic)
        }
        return newArticles
    }

    func test_IsBackgroundcolorValid() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.view.backgroundColor, .blue)
    }
    func test_titleIsValid() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.title, "Hey")
    }
    func test_tableViewDelegateAndDatasourseIsValid() {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertNotNil(sut.tableView.dataSource)
    }

    // MARK: Tableview 0
    func test_tableViewShouldBeEmpty()  {
        // when
        sut.articles = createArticleWithCount(num: 0)
        // then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    // MARK: Tableview 1
    func test_tableViewShouldBeOne() {
        // when
        sut.articles = createArticleWithCount(num: 1)
        sut.loadViewIfNeeded()
        // then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    // MARK: Tableview Many
    func test_tableViewShouldBeMany() {
        // when
        sut.loadViewIfNeeded()
        sut.articles = createArticleWithCount(num: 3)
        // then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }

    func test_tableViewShouldBeSameWithService() {
        sut.loadViewIfNeeded()
        sut.fetchData()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 15)
    }

}


