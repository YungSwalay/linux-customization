# linux-customization
My personal Linux/GNOME customization files

Ulitmately, a `Makefile` should be composed, which when:

`make install`

is executed will install the files in this repositiory into their appropriate
locations so that the system is customized in the way "the way I like".

Because I tend to use different flavors of Linux for work and play and I do
experiment with different varieties of Linux, it is expected that occasional
issues may emerge with, for example, `.bashrc`, which may perform different
tasks and call on different files in RHEL based vs. Debian based systems.

## TODOs

* Write `Makefile` which will check for binaries and install configurations accordingly
  * **NOTE** - `~/.local/share/gnome-background-properties/` is the final location for `wallpapers/my-slideshow-wallpaper.xml` on the target system.
    * **NOTENOTE** - There may be a programmatic way of finding this directory using a GNOME function or something like that.  Further reading is needed.
* Write script for adding images to the `wallpapers/my-slideshow.xml`
