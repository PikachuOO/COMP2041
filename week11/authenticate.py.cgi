#!/usr/bin/env python

import cgi
import cgitb  # for debugging

cgitb.enable()
cgitb.enable(display=0, logdir="authenticate.py.log")


# HTML header
print 'Content-Type: text/html'
print
print '<!DOCTYPE html>'
print '<html lang="en">'

# HTML body
print '<body>'
form = cgi.FieldStorage()

inUser = form.getvalue("inUser")
inPass = form.getvalue("inPass")

if (inUser == None):
    # HTML get username
    print """
     <form method="post" action="authenticate.py.cgi">
     Username: <input type="text" name="inUser" maxlength="80" />
     </form>
    """
elif (inPass == None):
    print """
     <form method="post" action="authenticate.py.cgi">
     Password:
     <input type="password" name="inPass" maxlength="80" />
     <input type="hidden" name="inUser" value={0} maxlength="80" />
     </form>
    """.format(inUser)
else:
    if (inUser == "andrewt" and inPass == "correct"):
        print "Successfully authenticated"
    else:
        print "Username and/or password incorrect"

#item = form.getvalue("inUser")

# HTML footer
print '</body>'
print '</html>'
