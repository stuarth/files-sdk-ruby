# Status

## Example Status Object

```
{
  "code": 200,
  "message": "",
  "status": "",
  "data": "",
  "errors": {
    "fields": [

    ],
    "messages": [

    ]
  },
  "clickwrap_id": 1,
  "clickwrap_body": ""
}
```

* `code` (int64): Status HTTP code
* `message` (string): Error message
* `status` (string): Status message
* `data` (Auto): Additional data
* `errors` (Errors): A list of api errors
* `clickwrap_id` (int64): Required Clickwrap id
* `clickwrap_body` (string): Required Clickwrap body
