# App

## Example App Object

```
{
  "name": "",
  "extended_description": "",
  "documentation_links": "Important Info => http://files.test/learn-more",
  "icon_url": "",
  "logo_url": "",
  "logo_thumbnail_url": "",
  "sso_strategy_type": "",
  "remote_server_type": "",
  "folder_behavior_type": "",
  "external_homepage_url": "",
  "app_type": "",
  "featured": true
}
```

* `name` (string): Name of the App
* `extended_description` (string): Long form description of the App
* `documentation_links` (string): Collection of named links to documentation
* `icon_url` (string): App icon
* `logo_url` (string): Full size logo for the App
* `logo_thumbnail_url` (string): Logo thumbnail for the App
* `sso_strategy_type` (string): Associated SSO Strategy type, if any
* `remote_server_type` (string): Associated Remote Server type, if any
* `folder_behavior_type` (string): Associated Folder Behavior type, if any
* `external_homepage_url` (string): Link to external homepage
* `app_type` (string): The type of the App
* `featured` (boolean): Is featured on the App listing?


---

## List Apps

```
Files::App.list(
  page: 1, 
  per_page: 1
)
```

### Parameters

* `page` (int64): Current page number.
* `per_page` (int64): Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended).
* `action` (string): Deprecated: If set to `count` returns a count of matching records rather than the records themselves.
* `cursor` (string): Send cursor to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header.
* `sort_by` (object): If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `name` and `app_type`.
* `filter` (object): If set, return records where the specifiied field is equal to the supplied value. Valid fields are `name` and `app_type`.
* `filter_gt` (object): If set, return records where the specifiied field is greater than the supplied value. Valid fields are `name` and `app_type`.
* `filter_gteq` (object): If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `name` and `app_type`.
* `filter_like` (object): If set, return records where the specifiied field is equal to the supplied value. Valid fields are `name` and `app_type`.
* `filter_lt` (object): If set, return records where the specifiied field is less than the supplied value. Valid fields are `name` and `app_type`.
* `filter_lteq` (object): If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `name` and `app_type`.