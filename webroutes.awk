#!/usr/bin/awk -f mynet.awk -f nn.awk -f

function display_input_form(input0, input1)
{
    print "<br>Please submit a query for the neural net:"

    print "<form action=\"/runnet\">"
    print "    <label for=\"input0\">input[0]=</label>"
    print "    <input type=\"number\" id=\"input0\" name=\"input0\" min=\"0\" max=\"1\" step=\"0.01\" value=\"" input0 "\"><br><br>"
    print "    <label for=\"input1\">input[1]=</label>"
    print "    <input type=\"number\" id=\"input1\" name=\"input1\" min=\"0\" max=\"1\" step=\"0.01\" value=\"" input1 "\"><br><br>"
    print "    <input type=\"submit\" value=\"Submit\">"
    print "</form>"
}

/^GET \/ HTTP\/1\.1/ { 
    print "HTTP/1.1 200 OK"
    print "Content-Type: text/html\n"

    print "<h1>Welcome to the future!</h1>"

    display_input_form(0, 0)

    exit
}

/^GET \/runnet\?input0=[0-9]+[0-9]*\.?[0-9]*&input1=[0-9]+[0-9]*\.?[0-9]* HTTP\/1\.1/ {
    split($0, all_pieces, /(\??&?input[0-9]=| )/)
    # patsplit($0, z, /[0-9]+/)

    # contains data
    vec[0] = all_pieces[3]
    vec[1] = all_pieces[4]
    out_vec[0] = -1

    runnet(vec, out_vec)

    print "HTTP/1.1 200 OK"
    print "Content-Type: text/html\n"

    print "<h1>Results!</h1>"

    display_input_form(all_pieces[3], all_pieces[4])

    print "The result of the calculation is: "

    print out_vec[0]

    exit
}

# catch incorrect formatting
/^GET \/runnet/ {
    print "HTTP/1.1 400 Bad Request"
    print "Content-Type: text/html\n"

    print "<h1>400</h1><br> You supplied a malformed query!\n"
    exit
}

# other case where this is a 404
/^GET \/*/ {
    print "HTTP/1.1 404 Not Found"
    print "Content-Type: text/html\n"
    print "<h1>404</h1><br> that's an error!\n"
    exit
}