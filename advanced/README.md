# Advanced Percy + XCUI (Swift)

This directory documents the advanced Percy SDK feature surface for `PercyXcui`. See the basic example at `SampleXCUITests/SampleXCUITests.swift` for the minimum integration.

## Layout asymmetry

XCUI tests must live under the Xcode test target (`SampleXCUITests/`) and be linked into `Sample iOS.xcodeproj` — they can't be relocated under `advanced/` without breaking the build. As a result, the advanced test code lives at:

`SampleXCUITests/AdvancedScreenshotTests.swift`

…while this `advanced/` directory holds only the `matrix.yml` (canonical row mapping) and this README. **You will also need to add `AdvancedScreenshotTests.swift` to the `SampleXCUITests` target in Xcode** — open `Sample iOS.xcodeproj`, select the file in the Project navigator, and check the `SampleXCUITests` checkbox in the File inspector.

## What the advanced test covers

5 XCTest cases in `AdvancedScreenshotTests.swift`:

- `testExercisesBaseline` — bare screenshot
- `testExercisesNavBarAndStatusBarHeight` — `ScreenshotOptions.navigationBarHeight` + `.statusBarHeight`
- `testExercisesFullscreen` — `ScreenshotOptions.fullscreen`
- `testExercisesOrientationLandscape` — `XCUIDevice.shared.orientation = .landscapeLeft`
- `testExercisesBuildMetadataViaEnv` — `PERCY_PROJECT` / `PERCY_BUILD` / `PERCY_BRANCH` / `PERCY_COMMIT` read by the SDK at upload time

Other native matrix rows (ignore/consider regions, sync, test_case, labels) are marked `Planned` in `matrix.yml` — `PercyXcui`'s `ScreenshotOptions` surface is narrower than the Appium SDK family.

Web-only rows (widths, percyCSS, etc.) are marked `N/A`.

## Run locally

Requires Xcode + the Percy CLI:

```bash
export PERCY_TOKEN="<your project token>"
npx @percy/cli@^1.31.13 app:exec -- \
  xcodebuild test \
    -project 'Sample iOS.xcodeproj' \
    -scheme 'Sample iOS' \
    -destination 'platform=iOS Simulator,name=iPhone 14' \
    -only-testing:SampleXCUITests/AdvancedScreenshotTests
```

## CI note

The advanced CI job is `workflow_dispatch`-only on `macos-latest` — XCUI tests require a macOS runner with Xcode + iOS Simulator. See `.github/workflows/advanced.yml`.

## Coverage matrix

States: `Covered` / `N/A — <reason>` / `Planned` / `Deprecated`. Source of truth is [`matrix.yml`](./matrix.yml).
