# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.3] - 2023-01-24
- UPS Service: Record USPS tracking code (#153)

## [0.7.2] - 2023-01-24
- ShipEngine Service: Allow sending a label image ID when creating labels (#152)

## [0.7.1] - 2023-01-20
- ShipEngine Service: Include package dimensions even if package code given

## [0.7.0] - 2022-12-14
- Removes dependency on unmaintained data_uri gem
- Bumps required Ruby to 2.7

## [0.6.5] - 2022-04-25

### Added
- USPS Service: Add support for returned dimensional weight (#128)
- USPS Service: Add support for returned fees (#127)

### Changed
- ShipEngine Service: Prevent exceptions when no rates are returned (#125)
- Misc dependency updates (#116, #120, #121, #124)

## [0.6.4] - 2021-01-27

### Added
- UPS Service: Include negotiated charges for UPS (#119)
- UPS Service: Include shipment-level itemized charges (#117)

## [0.6.3] - 2020-10-30

### Added
- USPS Service: Append HFP (Hold For Pickup) to service code when necessary (#110)
- USPS Service: Add Priority Cubic shipping method (#113)

### Changed
- USPS Service: Refactor to use explicit service codes (#111)
- USPS Service: Match Priority Express by CLASSID instead of service name (#112)
- UPS Service: Rename peak surcharge keys to match UPS docs (#114)

## [0.6.2] - 2020-08-12

- UPS Service: Be more resilient when UPS does not send a PickupTime element

## [0.6.1] - 2020-03-11

- Add Content-Type header to UPS Freight API requests, fixing "Name too long" 500 error responses

## [0.6.0] - 2020-03-11

- Changelog additions missed in previous release

## [0.5.3] - 2020-03-11

- UPS Service: Add support for shipping labels / bills of lading (#92)
- UPS/USPS Services: Return ApiFailure instead of a string for failed API responses (#95)
- UPS/USPS Services: Refactor ApiFailure to subclass ApiResponse (#96)

## [0.5.2] - 2020-01-31

### Added
- USPS Service: Added rectangular boolean to rate options class (#89)
- USPS Service: Added readable body to request class (#88)

### Removed
- USPS Service: Drop deprecated rectangular container (#89)

## [0.5.1] - 2020-01-28

### Changed
- USPS Service: Rename "Package Services" shipping method (#85)
- Documentation updates (#86)

## [0.5] - 2020-01-24

### Removed
- Drop support for Ruby 2.4 (#83)

### Changed
- UPS/USPS Services: Use options classes for rate estimates (#82)

## [0.4.14] - 2020-01-21

### Changed
- Code Style: Move development dependencies to Gemspec (#76)
- USPS Service: Fix documentation (#76)
- USPS Service: Use "Acceptance Date" if "Effective Acceptance Date" invalid (#79)

## [0.4.13] - 2020-01-18

### Changed
- USPS Service: Gracefully handle bogus responses from USPS (#77)

## [0.4.12] - 2020-01-15

### Changed
- USPS Service: Identify packages within a shipment by index rather than by ID (#74)

## [0.4.11] - 2020-01-14

### Changed
- USPS Service: Identify packages within a shipment by index rather than by ID (#72)
- USPS Service: Do not raise if multiple rates for a package and shipping method are present (#72)

## [0.4.10] - 2020-01-10

### Changed
- USPS Service: Gracefully handle missing timing estimates for Alaska/Hawaii (#70)

## [0.4.9] - 2020-01-09

### Changed
- USPS Service: Add missing Commitment sequence (#68)
- Code quality: Add double splats for Ruby 2.7 compatibility (#67)
- UPS Service: Add more package-level detail to rate responses (#65)

## [0.4.8] - 2020-01-06

### Changed
- USPS Service: Only transmit weights up to 150 pounds to timing API (#64)
- UPS Service: Transmit City and State when asking for timing information (#62)
- USPS Service: Gracefully handle missing expedited timing nodes (#60)

## [0.4.7] - 2019-11-28

### Changed
- UPS Service: Add timing support
- UPS Service: Add indicator for address type changes when quoting rates
- USPS Service: Add timing support
- Explicitly set Money rounding mode

## [0.4.6] - 2019-11-28

### Changed
- UPS Service: Add Support for voiding labels

## [0.4.5] - 2019-11-27

### Changed
- UPS Labels: Use correct Residential Address indication tag

## [0.4.4] - 2019-11-27

### Changed
- UPS Labels: Allow passing ShipperReleaseIndicator
- UPS Labels: Fix bug that did not allow reference numbers

## [0.4.3] - 2019-11-27

### Changed
- UPS Freight: Allow passing PickupRequest element with Pickup date

## [0.4.2] - 2019-11-19

### Changed
- UPS Freight: Pass TimeInTransitIndicator as a String rather than a Boolean

## [0.4.1] - 2019-11-15

### Changed
- Bugfix release: The file `types.rb`, which was accidentally put into `spec`, was moved to `lib`.

## [0.4.0] - 2019-11-11

### Added
- UPS Freight Service (rates estimation only for now)
- UPS: Label generation

### Changed

- All API methods now take a shipment, sometimes a typed Options object, and a `debug` flag.
- There are option classes for shipments, packages, and items. See the spec for UPS Freight about how they work.

### Changed
- Add ConsigneeName to Address validation/classification request

## [0.3.3] - 2019-10-25

### Changed
- Fix: ShipEngine#labels test mode works again.

## [0.3.2] - 2019-10-25

### Changed
- Fix: ShipEngine#labels now works as expected.

## [0.3.1] - 2019-06-20
### Added
- Endpoint for UPS address classification

### Changed
- `ShipEngine#labels` now needs a second argument, the shipping method.
