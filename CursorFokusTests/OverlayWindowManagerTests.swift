import Testing
@testable import CursorFokus

@MainActor
struct OverlayWindowManagerTests {

    @Test
    func managerInitializesWithoutError() {
        let manager = OverlayWindowManager()
        manager.setup()
        #expect(true)
        manager.teardown()
    }

    @Test
    func teardownAfterSetupDoesNotCrash() {
        let manager = OverlayWindowManager()
        manager.setup()
        manager.teardown()
        #expect(true)
    }

    @Test
    func doubleTeardownDoesNotCrash() {
        let manager = OverlayWindowManager()
        manager.teardown()
        manager.teardown()
        #expect(true)
    }
}
