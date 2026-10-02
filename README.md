# appleJuice Core (Client)

![](https://img.shields.io/github/v/release/applejuicenetz/core.svg)
![](https://img.shields.io/github/downloads/applejuicenetz/core/total)
![](https://img.shields.io/badge/license-proprietary-blue?color=orange)

![](https://github.com/applejuicenetz/core/actions/workflows/container.yml/badge.svg)
![](https://img.shields.io/docker/pulls/applejuicenetz/core)
![](https://img.shields.io/docker/image-size/applejuicenetz/core)

![](https://snapcraft.io/applejuice-core/badge.svg)

Meta Repository für die appleJuice Core Releases.

## Build and release pipeline

`core-src` builds, tests, obfuscates and signs the JAR. After manual approval in
its `maven-publish` environment, it publishes an immutable version such as
`de.applejuicenet:ajcore:0.35.185.42` to this repository's Maven registry.

`.github/workflows/release.yml` starts on `registry_package: published`, filtered
to the `de.applejuicenet.ajcore` Maven package. As in `server`, incomplete
publications are ignored until all six Maven files are present. Alternatively,
run it manually with an already published version. The workflow downloads the
JAR once, checks its SHA-1 checksum and main class, and shares the exact artifact
with all package jobs. No Java sources are checked out or compiled here.

The package jobs produce macOS DMGs, Windows EXEs and Linux Flatpak bundles,
each for amd64 and aarch64. Packaging resources and Windows installer checks
are maintained in `assets/`, `flatpak/` and `scripts/`. Package builds and the
combined `AJCore-packages-<version>` artifact require no release approval.

Manual runs default to `dry_run: true`: all packages are built and uploaded as
Actions artifacts, but `publish-release` is skipped entirely. No GitHub release
or tag is created or modified. Set `dry_run: false` explicitly to request release
publication after environment approval. Maven package events retain the normal
approval-gated release flow.

Only `publish-release` creates the `v<version>` tag and GitHub release, after
manual approval in the `release` environment. It publishes all six packages
and the original Maven JAR without rebuilding. Configure this environment with
required reviewers; publication fails closed if none are configured. Restrict
deployment branches to the default branch and disable administrator bypass if
required by your approval policy. The source repository separately needs its
`maven-publish` environment and `PACKAGE_RW_TOKEN` secret.

Native installer versions omit the leading `0.` from the four-part Maven version:
`0.35.185.42` becomes `35.185.42`. This preserves the build number for upgrades
while satisfying the three-part version format of Windows and macOS installers.
The native major and minor components must not exceed 255, the build component
must not exceed 65535, and the native major component must be greater than zero.
Flatpak metadata, Maven coordinates and release tags retain all four components.

## Installation

| Platform 	  | Link          	                                               |
|-------------|---------------------------------------------------------------|
| Windows  	  | [*setup.exe](https://github.com/applejuicenetz/core/releases) |
| macOS    	  | [AJCore.dmg](https://github.com/applejuicenetz/core/releases) |
| Linux    	  | [Flatpak Package](https://github.com/applejuicenetz/flatpak)	 |
| Docker    	 | [zur Anleitung](./docker/)	                                   |
