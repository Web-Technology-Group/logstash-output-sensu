logstash-output-sensu
=====================

A Sensu client output for Logstash

Basic usage
===========

```python
output {
  sensu {
    check => "%{field}"
    output => "%{message}"
  }
}
```

Options
-------

| Name     | Type   | Required | Values                                                       |
|----------|--------|----------|--------------------------------------------------------------|
| check    | String | True     | Any (Make sure it doesn't conflick with another sensu check) |
| host     | String | False    | IP, FQDN but defaults to localhost                           |
| port     | String | False    | Port the Sensu client is listening on, defaults to 3030      |
| status   | Number | False    | 0 = OK, 1 = WARN, 2 = CRITICAL, 3 = CUSTOM - default is 2    |
| handlers | Array  | False    | List of sensu handlers, default is empty                     |
| output   | String | True     | Any                                                          |

### Usage will all options

```python
output {
  sensu {
    check => "%{field}"
    host => "localhost"
    port => 3030
    status => 2
    handlers = ["mailer"]
    output => "%{message}"
  }
}
```

Todo
----

-	[ ] Sprintf feature on handlers
-	[ ] Tests
