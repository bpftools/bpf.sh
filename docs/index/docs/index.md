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
* [xdp-tutorial](https://github.com/xdp-project/xdp-tutorial) contains a tutorial that aims to introduce you to the basic steps needed to effectively write programs for the eXpress Data Path (XDP) system in the Linux kernel, which offers high-performance programmable packet processing integrated with the kernel. By [XDP Project](https://github.com/xdp-project).

## Tracing and Performance Analysis

* [We just got a new super-power! Runtime USDT comes to Linux](https://medium.com/sthima-insights/we-just-got-a-new-super-power-runtime-usdt-comes-to-linux-814dc47e909f) a medium arcticle by Matheus Marchini of Netflix, introducing libstapsdt to dynamically add USDT tracepoints in arbitrary languages.

## Books on eBPF

eBPF is a very new topic so there aren't a lot of books, but take a look at:

* Upcoming [Linux Observability with BPF](https://www.oreilly.com/library/view/linux-observability-with/9781492050193/) by Lorenzo Fontana, David Calavera
* Upcoming [BPF Performance Tools](http://www.brendangregg.com/blog/2019-07-15/bpf-performance-tools-book.html) by Brendan Gregg, reviewers editors include Dale Hamel

Both are or will be visible on Safari soon, so you can make an account with O'Reilly to read electronic editios of them before they are available in print.

## eBPF Security

Here are a number of eBPF security resources.

#### Rootkits and Research

* [Boopkit](https://github.com/kris-nova/boopkit) is an eBPF based rootkit for Linux kernels built to assist Ukraine after the Russian invasion by [Kris Nóva](https://github.com/kris-nova).
* [Triple Cross](https://github.com/h3xduck/TripleCross) is an academic research project, with working code, on advanced rootkit command and control with eBPF. TripleCross is a Linux eBPF rootkit that demonstrates the offensive capabilities of the eBPF technology. By [Marcos Bajo](https://github.com/h3xduck).
* [ebpfkit](https://github.com/Gui774ume/ebpfkit) is a rootkit that leverages multiple eBPF features to implement offensive security techniques. We implemented most of the features you would expect from a rootkit: obfuscation techniques, container breakouts, persistent access, command and control, pivoting, network scanning, Runtime Application Self-Protection (RASP) bypass, etc. By [Guillaume Fournier](https://github.com/Gui774ume).

## Additional Resources

* [awesome-ebpf](https://github.com/zoidbergwill/awesome-ebpf) is an alternative curated collection of eBPF resources.

# Want to contribute?

This site is meant to be easy to contribute to! Add a report using the existing format by following the [contributing guidelines](https://github.com/bpftools/bpf.sh/blob/master/CONTRIBUTING.md). To get started, you just need to write markdown! A number of pandoc extensions are supported by default - but you can use any static site builder you'd like if you want to contribute.

Get in touch Lorenzo on Twitter at [\@fntlnz](https://twitter.com/fntlnz) or `lo at bpf.sh` ([GPG](https://fntlnz.wtf/downloads/pubkey-B2400EE4.asc)), or open an issue on https://github.com/bpftools/bpf.sh and ping another maintainer of the `bpftools` org.
