# Architecture Notes

## Modules

### `photobooth.core`
Pure image composition logic. This is where strip generation belongs because it is reusable from desktop, server, batch jobs, or future kiosks.

### `photobooth.desktop`
Swing UI for operating a booth station. It should orchestrate user actions, not contain image-processing logic.

### `photobooth.camera`
Capture abstractions. The UI depends on the `CameraCaptureService` interface instead of a concrete webcam implementation.

Current adapters:
- `FileChooserCaptureService` — fake-it-till-you-wire-it local frame source
- `WebcamCapturePlaceholderService` — explicit extension point for a real camera library

### `photobooth.server`
Tiny upload server using the JDK HTTP server. Good enough for a starter, not pretending to be enterprise NASA Kubernetes wizardry.

### `photobooth.util`
Small shared helpers. Keep this boring. Utility folders love becoming junk drawers.

## Design choices

- **Dependency-free first**: the repo runs with just Java 21
- **SOLID-ish boundaries**: UI does not own capture implementation details
- **YAGNI**: no framework pile-on for a tiny starter
- **DRY**: shared strip generation stays in one place

## Next clean extension

When you are ready for real webcam support, add another `CameraCaptureService` implementation backed by a camera library. The desktop UI should not need major changes.
