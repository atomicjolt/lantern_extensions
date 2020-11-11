# Lantern Extensions

This is a Canvas plugin that provides some modifications for JPay. The
modifications include enforcing stronger passwords, and modifying some email
templates to replace Canvas branding with Lantern LMS branding.

## Installation

- Place this gem in gems/plugins within canvas.
- Start or restart Canvas.
- Navigate to /plugins in Canvas and enable the Lantern LMS extensions plugin.
- Restart Canvas again. It could potentially be made to take effect immediately,
  but this keeps things simple in terms of code and performance.

## Development

This code must be run within Canvas as described in the Installation section.

In order to help keep up with changes to the emails templates in canvas, there
is a script at ./bin/generate_templates.sh that will copy the templates from
canvas and apply some patch files to make the desired changes.

In the event that the patches can no longer be applied, because significant
changes have been made in canvas, the templates can be modified manually, and
then ./bin/generate_diffs.sh will create new diffs based on those changes.
