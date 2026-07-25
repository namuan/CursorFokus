.PHONY: generate format lint analyze dead-code test build run precommit clean

generate:
	xcodegen generate

format:
	swift format --in-place --recursive CursorFokus/ CursorFokusTests/ CursorFokusUITests/

lint:
	swiftlint lint --strict

analyze:
	@bash Scripts/swiftlint-analyze.sh

dead-code:
	periphery scan

test:
	xcodebuild test -project CursorFokus.xcodeproj -scheme CursorFokus -destination 'platform=macOS'

build:
	@bash Scripts/build-app.sh

run: build
	@open "Build/CursorFokus.app"

precommit: format lint analyze dead-code test

clean:
	rm -rf CursorFokus.xcodeproj DerivedData TestResults Build .build
