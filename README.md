# DIT Digital Workspace

[![Build Status](https://travis-ci.org/uktrade/digital-workspace.png?branch=master)](https://travis-ci.org/uktrade/digital-workspace)

## Tests
The test suite can be run as:
`rake ci`
A common failure arises when an API interaction has changed. In the test suite, calls to external APIs are cached with the [VCR gem](https://github.com/vcr/vcr).
A typical VCR error message might say:
```
 VCR is currently using the following cassette:
 /path/to/a/vcr/cassette.yml
```
Delete the casette `rm /path/to/a/vcr/cassette.yml` and VCR should create a new one that can be committed to the repo.

## Local environment variables

In development, environment variables can be defined in `.env`. To determine which environment variables to set, refer to `.env.example`.

When implement environment variables that app will depend on, be sure to keep the `env.example` up to date!

## DIT SSO Authentication

Authentication to Log in to People Finder in the various environments (dev/staging/prod) is by setting the following environment variables:

`DITSSO_INTERNAL_PROVIDER`
`DITSSO_INTERNAL_CLIENT_ID`
`DITSSO_INTERNAL_CLIENT_SECRET`
