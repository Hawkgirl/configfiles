#! /usr/bin/python
import subprocess
out=subprocess.check_output(['last', '-n', '1','--time-format=iso'])
print out
if out.find('logged') != -1:
        print 'user logged in'
	exit()

import datetime
import dateutil.parser

last_logout_str=out.split()[5]

last_logout_time= dateutil.parser.parse(last_logout_str.rsplit('+0')[0])
current_time=datetime.datetime.now()
print 'current time is',current_time
previous_time = current_time - datetime.timedelta(minutes=5)
print 'previous time is',previous_time
print 'last logout time is',last_logout_time

if previous_time > last_logout_time:
	print 'shutdown the container'
        subprocess.check_output(['/usr/bin/supervisorctl','shutdown'])

print 'normal exit'

