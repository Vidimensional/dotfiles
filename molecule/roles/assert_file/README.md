# Check file exists (and has some attributes)

- [Check file exists (and has some attributes)](#check-file-exists-and-has-some-attributes)
  - [Description](#description)
  - [Variables](#variables)

## Description

This role is for molecule testing.

It checks that the file exists in `path` (and has some attributes).

## Variables

- **`path`**: (mandatory) path where the file should be found.
- **`checksum`**: (optional, default value `null`) if defined checks if file has the defined checksum (with the algorithm defined in `checksum_algorithm`).
- **`checksum_algorithm`**: (optional, default value `"sha1"`) the algorithm to Algorithm to determine checksum of file.
- **`file_mode`**: (optional, default value `null`) if defined, checks if file has the defined mode (octal mode only).
