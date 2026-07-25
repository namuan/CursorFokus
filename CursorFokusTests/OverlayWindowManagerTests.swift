import Testing
@testable import CursorFokus

@MainActor
struct OverlayWindowManagerTests {

    @Test
    func managerInitializesWithoutError() {
        let manager = OverlayWindowManager()
        manager.setup()
        manager.teardown()
    }

    @Test
    func teardownAfterSetupDoesNotCrash() {
        let manager = OverlayWindowManager()
        manager.setup()
        manager.teardown()
    }

    @Test
    func doubleTeardownDoesNotCrash() {
        let manager = OverlayWindowManager()
        manager.teardown()
        manager.teardown()
    }
}
