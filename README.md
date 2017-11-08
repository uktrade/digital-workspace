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

When implementing environment variables that the app will depend on, be sure to keep the `env.example` up to date!

## DIT SSO Authentication

Authentication to Log in to People Finder in the various environments (dev/staging/prod) is by setting the following environment variables:

`DITSSO_INTERNAL_PROVIDER`
`DITSSO_INTERNAL_CLIENT_ID`
`DITSSO_INTERNAL_CLIENT_SECRET`

In development, you will need to ensure that these environment variables are configured in `.env`. You will also need to ensure that you can log into the DIT SSO provider.

## Peoplefinder Profile
The Peoplefinder Profile for the authenticated user can be retrieved by:
`PeopleFinderProfile.from_api(current_user)` where `current_user` is a User object or just an email address.

e.g.
```
PeopleFinderProfile.from_api(User.new(email: 'alice@example.com)
or
PeopleFinderProfile.from_api('alice@example.com')
```

With a PeopleFinderProfile object, you have can, for example, retrieve the person's name:
```
profile = PeopleFinderProfile.from_api('alice@example.com')
puts profile.name
#=> Alice Arnold
```
Ensure that the environment variables are defined:
`PEOPLEFINDER_URL`
`PEOPLEFINDER_AUTH_TOKEN`

## Word Press API
The Word Press API URL should be defined as an environment variable:
`WP_API_URL`
As should the API Authentication Key:
`WP_API_KEY`

## Redis
Currently the app expects (in production):
`REDIS_URL` (defines the Redis cache store)
Note that this must be SSL/TLS and defined as: `rediss://...`.

## Twitter Feed
Ensure that the keys are set so that the Twitter feed is enabled
`TWITTER_KEY`
`TWITTER_SECRET`

## Caching
The strategy is to cache API calls for 1 minute. Currently this is done against the Word Press API:
See `Rails.cache.fetch` in `wp_api.rb`.

To enable the redis cache in development and test:
`rake dev:cache`
NOTE: if the cache is enabled this might affect test behaviour!
