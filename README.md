# Update - No longer maintainted

way2sms
=======

Send sms across India using your way2sms account. This gem was originally created in 2014 as a hobby project and was published as a gem - https://rubygems.org/gems/way2sms. Since then, there has been no update to this code. 

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

