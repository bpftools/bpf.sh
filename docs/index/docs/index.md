---
title: bpf.sh

---

bpf.sh
------

# Hosted on this site

These reports have been published directly to bpf.sh:

* [production-breakpoints-doc](../production-breakpoints-doc/index.html), a publication from Dale Hamel of Shopify on an experimental concept of dynamically injecting USDT tracepoints into methods running in a Production environment.
* [usdt-report-doc](../usdt-report-doc/index.html), a publication from Dale Hamel of Shopify on USDT tracing, demonstrating how USDT tracing
works by explaining the anatomy of the gem ruby-static-tracing.

Feel free to contribute to any reports on this site - it's meant to be collaborative.

If you've been doing something cool with eBPF, please consider contributing your own report!

# External eBPF resources

## XDP and Networking

* [Load XDP programs with
iproute2](https://medium.com/@fntlnz/load-xdp-programs-using-the-ip-iproute2-command-502043898263),
a medium article from Lorenzo Fontana demonstrating a basic usage of XDP
to load an eBPF program.

## Tracing and Performance Analysis

* [We just got a new super-power! Runtime USDT comes to Linux](https://medium.com/sthima-insights/we-just-got-a-new-super-power-runtime-usdt-comes-to-linux-814dc47e909f) a medium arcticle by Matheus Marchini of Netflix, introducing libstapsdt to dynamically add USDT tracepoints in arbitrary languages.

## Books on eBPF

eBPF is a very new topic so there aren't a lot of books, but take a look at:

* Upcoming [Linux Observability with BPF](https://www.oreilly.com/library/view/linux-observability-with/9781492050193/) by Lorenzo Fontana, David Calavera
* Upcoming [BPF Performance Tools](http://www.brendangregg.com/blog/2019-07-15/bpf-performance-tools-book.html) by Brendan Gregg, reviewers editors include Dale Hamel

Both are or will be visible on Safari soon, so you can make an account with O'Reilly to read electronic editios of them before they are available in print.

# Want to contribute?

This site is meant to be easy to contribute to! Add a report using the existing format by following the [contributing guidelines](https://github.com/bpftools/bpf.sh/blob/master/CONTRIBUTING.md). To get started, you just need to write markdown! A number of pandoc extensions are supported by default - but you can use any static site builder you'd like if you want to contribute.

Get in touch Lorenzo on Twitter at [\@fntlnz](https://twitter.com/fntlnz) or `lo at bpf.sh` ([GPG](https://fntlnz.wtf/downloads/pubkey-B2400EE4.asc)), or open an issue on https://github.com/bpftools/bpf.sh and ping another maintainer of the `bpftools` org.
