import Foundation
import XCTest
import ComposableArchitecture
@testable import Diggle

@MainActor
final class DiggleTests: XCTestCase {
    func testOnGenreButtonTapped() async {
        let store = TestStore(initialState: FavoriteGenreFeature.State()) {
            FavoriteGenreFeature()
        } 

        let randomGenre = store.state.selectedGenres.randomElement()!

        await store.send(.onGenreTapped(randomGenre)) {
            if let index = $0.selectedGenres.index(id: randomGenre.id) {
                $0.selectedGenres[index].isSelected.toggle()
            }
        }
    }
}
