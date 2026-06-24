// PER-8195 Phase 2 — XCUI advanced example.
// Each XCTest case exercises one row of the App Percy / Appium Native matrix.
// See ../advanced/matrix.yml for the canonical mapping.
//
// XCUI tests must live under a `*Tests` test target attached to the
// Xcode project (SampleXCUITests). The sibling advanced/ directory holds
// the matrix.yml + README that document this asymmetry.

import XCTest
import PercyXcui

class AdvancedScreenshotTests: XCTestCase {
    var appPercy: AppPercy!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        appPercy = AppPercy()
    }

    func testExercisesBaseline() {
        try? appPercy.screenshot(name: "Sample iOS — baseline")
    }

    func testExercisesNavBarAndStatusBarHeight() {
        var options = ScreenshotOptions()
        options.navigationBarHeight = 100
        options.statusBarHeight = 100
        try? appPercy.screenshot(name: "Sample iOS — nav + status bar heights", options: options)
    }

    func testExercisesFullscreen() {
        var options = ScreenshotOptions()
        options.fullscreen = true
        try? appPercy.screenshot(name: "Sample iOS — fullscreen", options: options)
    }

    func testExercisesOrientationLandscape() {
        XCUIDevice.shared.orientation = .landscapeLeft
        try? appPercy.screenshot(name: "Sample iOS — landscape")
        XCUIDevice.shared.orientation = .portrait
    }

    func testExercisesBuildMetadataViaEnv() {
        // PERCY_PROJECT / PERCY_BUILD / PERCY_BRANCH / PERCY_COMMIT are read
        // by the AppPercy SDK at upload time via ProcessInfo.environment.
        // This test documents the env-driven knobs; no per-call option needed.
        try? appPercy.screenshot(name: "Sample iOS — build metadata via env")
    }
}
