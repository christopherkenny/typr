## Resubmission

* The prior submission was flagged for a leaving a file on Debian. There was a 
  stray call to `utils::browseURL()` that was not wrapped in `interactive()`,
  which is now fixed.

## Additional Notes

This fixes the CRAN error by catching cases where json returned by `typr_query()` was malformed.

## Test environments

* local R installation (Windows 11), R 4.5.0
* local R installation (macOS 11.4), R 4.5.0
* ubuntu 22.04 (on GitHub Actions), (devel and release)
* windows-latest (on GitHub Actions), (release)
* macOS-latest (on GitHub Actions), (release)
* Windows (on Winbuilder), (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes
