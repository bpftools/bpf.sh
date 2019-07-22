# What to add here?

- Have you got something new an interesting to share?
- Does it contribute to a shared knowledge of the emerging eBPF technology?
- Is it related to XDP, tracing, security, or some new use of eBPF?

Then consider adding it here!

Drawing inspiration from sites like [awesome-dtrace](https://awesome-dtrace.com/) the goal of this site is to raise the profile of eBPF tools and help to grow the community of eBPF users.

A collection of useful documentation, analyses of code in experimental or production frameworks, new concept and proof of concept are all great ideas.

# Adding a new doc

To add a new doc to this repository, you can use the generalized "pandoc builder".

Simply clone a copy of the template repository to the docs folder, and it should be picked up by the site builder.

Otherwise, add your repo as a submodule of /docs, and ensure it has a /scripts/build.sh executable that builds the doc, and copies it to the / of the repository, so it will be uploaded to gh-pages.

Any images you reference in your doc are assumed to in /img relative to your repository.

## Pandoc builder

The main advantage this builder has over other markdown renderers is that it tries to make it easy annotate source code without copying it.

It also serves as a simple template / structure that other generators can use to contribute.

The default builder providers similar output to Github, as the style is based on Github.

### Annotating source code

The filter https://github.com/owickstrom/pandoc-include-code is applied to markdown sources, which allows for preprocessing that enables extending pandoc's markdown capabilities.

This allows for a usage like:

> ```{.gnuassembler include=src/ruby-static-tracing/ext/ruby-static-tracing/lib/libstapsdt/src/asm/libstapsdt-x86_64.s startLine=7 endLine=12}
> ```

The source code just needs to be added as a submodule to the src/ repo of a particular doc, and it will be fetched recursively during the page build. Note that if the source code changes, you may need to tweak the start and end lines if the file you reference was updated, but you probably should to update the docs around the changed code anyways.

The `.gnuassembly` is referring to one of pandoc's built-in style classes for code highlighting, and there are similar ones for `ruby` `c` `python` and the usual suspects. It had something as esoteric as assembly, you're probably covered. If not, there's a way to extend that too, and tweak the styling if you really want to, such as to match the color scheme of your favorite or a standard editor.

## Other builders

None have been added yet, but anything that can live as a submodule in the docs/ folder, and output to a directory in the root of this repository can be added.

If you like Jekyll, Hugo, or something else, feel free to add a builder for that. You just need to:

- Have a docker container, that has the build dependencies, like used for the `pandoc-report-builder`
- Add a file in your repo at /scripts/build.sh that can be called in order to generate the site and copy it to the right spot.
