# dockerlektor

### Simple docker-based method for using the lektor static site builder

This is a quick and dirty method of running lektor without allowing it
to access your machine's `/usr/local` filesystem, which I find rudely
intrusive for a package that doesn't need any system involvement.

### Included components:

#### Dockerfile

Use this to build the image that will actually run `lektor`. Suggested build command: `docker build -t lektor .`  The image
assumes that your site's source code is stored in `$PWD/src`,
and it will output the resulting HTML to `$PWD/build` when
using the `lektor build` command.

#### lektor-rc.sh

This `bash` script sets up a local `lektor` command that you
can run, that will run the docker image, passing your arguments
through to the actual `lektor` command.  I recommend you add
this script to your shell's startup scripts.  I do this by having
a directory called `$HOME/rc`, and a line in my `.bash_profile`
script like: `for script in $HOME/rc/*.sh; do source $script; done`.

#### run.sh

This is the script that is the entrypoint for the docker image.
It does some special casing for the `build` and `server` commands
so that the ports are set up correctly for the docker plumbing
and in order to set up the use of the assumed directories (`src`
and `build`), but otherwise just passes your arguments through.

## Quickstart

1. Clone the repo into a new directory: `git clone https://github.com/phoikoi/dockerlektor myproject`
2. Move into the new directory: `cd myproject`.
3. Build the docker image: `docker build -t lektor .`
4. Load the local script command: `source lektor-rc.sh`
5. Create your new project: `lektor quickstart`
6. Start the lektor server: `lektor server`
7. Edit your content until it's ready.
8. Build the output (stop the server with Ctrl-C first): `lektor build`
9. Deploy your content which has been written into tbe `build` directory.

