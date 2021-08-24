# Package Management

Every Linux Distro comes with their own pakage manager: dpkg for Debian (low-level of apt), apt/ apt-get for Ubuntu, pacman for Arch, rpm/ yum for RHL (Red Hat Linux),...

Even MacOS has Homebrew (more like a comunity not so official), Windows has winget/ chocoley (older).

## APT

APT (advanced package tools) is a user-friendly package manager for Ubuntu. Get-apt is its older version which can be more flexible and can do more things, but also complicated to use. Just ignore apt-get, although it's not going away.

Some useful commands to know about apt:
-   `apt install` (install package), `apt search` (search for a package), `apt show` (show info about a package)
-   `apt update` (update the list of pkg, kinda like indexing new version of it), `apt upgrade` (actually upgrade the package that need to be upgraded), `apt list --upgradable` (list upgradable packages), `apt autoremove` (remove unused pkgs), `apt full-upgrade` (combine `upgrade` and `autoremove`)

The bad things of APT maybe everytime it upgrade a package, it remove the package and install the whole new version of it. This problem is solved by Snaps. Also, the process of pack a package in apt somehow annoys developers, so some of them move to Snaps.

## Snaps

Canonical a few years announced a new way of packaging app called snaps. Snaps are advantageous over what was there before (apt typically deals with debs) for a few reasons:

-   They're totally self contained. They package all their dependencies with them
-   They're sandboxed. They can't mess with your system
-   They can update by just downloading the difference between ther versions

As stated above, it's just another way of packaging an app up and for the most part you don't really have to care. There's a few things that you do need to keep in mind however:

-   Snaps update automatically and you actually can't stop that from happening really. Debs update whenever you choose to do so
-   Snaps are safer. They're sandboxed and cannot break out of their home folders. Debs really can do whatever they want (some app requires `--classic` flag when installing to kinda break out that sandbox, so use that with the source you trust)
-   Snaps are also how Ubuntu lets publish GUI apps like Visual Studio Code, Spotify, Firefox, etc. There's more than just command line tools. [See here for the store](https://snapcraft.io/).
-   Debs are reviewed before they're allowed onto the registry. They have to be or else renegade devs could publish anything they want. Snaps, due to their sandboxing, don't have to be.

Btw, there're still a lot things that people dont like about Snaps (canical centric, heavier, dependent on systemd containers,...). There's always trade-off between options, be a wise user.


