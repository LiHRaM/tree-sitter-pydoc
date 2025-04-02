import XCTest
import SwiftTreeSitter
import TreeSitterPydoc

final class TreeSitterPydocTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_pydoc())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Pydoc grammar")
    }
}
