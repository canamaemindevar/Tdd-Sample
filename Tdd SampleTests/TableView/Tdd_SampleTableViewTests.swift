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

    var sut = HomeViewController()


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
        sut.articles = []
        // then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    // MARK: Tableview 1
    func test_tableViewShouldBeOne() {
        // when
        sut.loadViewIfNeeded()
        sut.articles = [""]
        // then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    // MARK: Tableview Many
    func test_tableViewShouldBeMany() {
        // when
        sut.loadViewIfNeeded()
        sut.articles = ["","",""]
        // then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }
}


