# database-parser

A form for recording event metadata, one event at a time. Each field is a multi-select dropdown, and the result exports as a Markdown file.

The fields, options and parser rules come from the **Event_Metadata_by_Category** Google Sheet. That data is kept in `data/event-metadata.json`.

## Run it

```sh
./serve.sh          # http://localhost:8787
./serve.sh --lan    # reachable from other devices on your network
```

The page loads `data/event-metadata.json` with `fetch`, so it must be served over HTTP. Opening `index.html` directly from disk won't load the data.

## Using the form

- **Start from:** loads one of the six events from the sheet into the form, or gives you a blank form.
- **Dropdowns:** pick any number of values. To add your own, type it in the search box and press Enter.
- **Include empty fields:** adds unfilled fields to the Markdown with `—` as the value.
- **Download .md / Copy Markdown:** exports the result. The file is named after the event.
- **Autosave:** your work is saved in the browser (`localStorage`).

## Data file

`data/event-metadata.json` holds:

- `events`: the six event names, in sheet column order.
- `categories`: each category, what it covers (`covers`) and how the parser uses it (`parserUse`), from the "Categories & Parser Rules" tab.
- `fields`: each metadata field, with `values` (one string per event, in the same order as `events`), the `source` of each value, and `keepWhole`.

The form turns a field's values into dropdown options by splitting them on commas. `keepWhole: true` keeps the comma as part of one value (for example `B2B Startup, Market A`).

To add a field or event, edit the JSON and reload the page.
