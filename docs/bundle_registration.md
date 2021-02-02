# BundleRegistration

## Example BundleRegistration Object

```
{
  "code": "abc123",
  "name": "account",
  "company": "Action Verb",
  "email": "john.doe@files.com",
  "inbox_code": "abc123",
  "form_field_set_id": 1,
  "form_field_data": ""
}
```

* `code` (string): Registration cookie code
* `name` (string): Registrant name
* `company` (string): Registrant company name
* `email` (string): Registrant email address
* `inbox_code` (string): InboxRegistration cookie code, if there is an associated InboxRegistration
* `form_field_set_id` (int64): Id of associated form field set
* `form_field_data` (string): Data for form field set with form field ids as keys and user data as values