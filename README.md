way2sms
=======

Send sms across India using your way2sms account

Installation
============

```gem install way2sms```

Initialize
==========

```w = Way2sms.new(username, password)```

Use the username and password used to login via way2sms site.

Send SMS
========

```w.send_sms(mobile_number, message)```

'message' is a normal string.
