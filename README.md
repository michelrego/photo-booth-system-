# Photo Booth System

A clean Java starter for a photobooth-style project with three core pieces:

- **Desktop station** for selecting booth frames and generating a printable strip
- **Web upload service** for sending booth output to a tiny Java server
- **Shared strip generator** that composes multiple images into one vertical strip
- **Capture abstraction layer** so webcam support can be added without mangling the UI

## Why this repo exists

If you want your GitHub to look active, do it the non-cringe way: build real stuff in small, honest steps. This repo is structured so you can make a bunch of meaningful commits over time instead of dumping one giant mystery blob at 2 a.m.

## Current scope

This starter is intentionally **dependency-free** and runs on Java 21 using only the JDK.

That means:
- strip generation works now
- the web upload service works now
- the desktop app works now for selecting local images
- a **camera capture interface** exists now
- **real webcam capture is still the next adapter to implement**

Keeping it JDK-only avoids premature dependency soup. YAGNI says hi.

## Project structure

```text
src/
  photobooth/
    camera/    # capture contracts and adapters
    core/      # reusable strip generation logic
    desktop/   # Swing desktop station
    server/    # tiny HTTP upload service
    util/      # file helpers
test/
  photobooth/
    core/      # lightweight test entry points
scripts/
  build.sh
  run-desktop.sh
  run-server.sh
  run-tests.sh
uploads/
output/
```

## Run it

### Build

```bash
chmod +x scripts/*.sh
./scripts/build.sh
```

### Start the upload server

```bash
./scripts/run-server.sh
```

Then open: <http://localhost:8080>

### Start the desktop app

```bash
./scripts/run-desktop.sh
```

Pick a few images, or use the capture source dropdown to try the current adapters.

### Run tests

```bash
./scripts/run-tests.sh
```

## Architecture

See:
- [`docs/architecture.md`](docs/architecture.md)
- [`docs/commit-plan.md`](docs/commit-plan.md)

## Realistic next milestones

1. Plug in a real webcam library adapter
2. Add strip templates and branding overlays
3. Add event/session folders for uploads
4. Add tests for upload parsing
5. Package apps with jpackage or a proper build tool
