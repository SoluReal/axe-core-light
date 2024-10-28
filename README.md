
# Axe-core light

[axe-core](https://github.com/dequelabs/axe-core) from Deque is a great accessibility library that is used by lots of Accessibility professionals around the world.

This repository contains patches and a build script to create a smaller version of the axe-core script.

This project is used by [ExcellentWebCheck's Accessibility Platform](https://excellentwebcheck.com/website-accessibility-checker) to decrease both the size of `axe.min.js` as well as the output of axe-core.

Because the Accessibility report is passed via websockets, it makes sense to remove some of the unnecessary data.
For [ExcellentWebCheck's Accessibility Platform](https://excellentwebcheck.com/website-accessibility-checker) no messages and translations are needed because we provide our own.

## Patches

The patches make the following adjustments:

* Remove all polyfills
* Support only the latest Chrome version
* Remove [description, help, help_url and messages](https://github.com/dequelabs/axe-core/blob/develop/doc/API.md#results-object) from the output.
* Remove metadata (url, timestamp, performance stats)

## Result

|                                 | axe-core | axe-core light |
|---------------------------------|----------|----------------|
| File size                       | 540K     | 423K           |
| Output size (small sample page) | 80.9K    | 46.6K          |

Note, we just stripped functionality and compatibility of axe-core and might not work for you!
Also, `axe-core` already provides several options to reduce output such as skipping `inapplicable`, `incomplete` results etc.

## Usage

```bash
./build.sh
```

Result can be found in: `axe-core/axe.min.js`

## Acknowledgements

All credits to the contributors of [axe-core](https://github.com/dequelabs/axe-core).

## Used By

This project is used by:

- [ExcellentWebCheck](https://excellentwebcheck.com)
