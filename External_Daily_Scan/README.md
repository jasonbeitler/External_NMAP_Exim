README

GEM required
mail

 - Uses exim or postfix - you will need to configure one of them your self

 - In external.rb you will need to change the home directory (Line 13)

 - In email_conf you will need to update both files with a To:email @ddress

 - In ip_list you will need to add the IP(s) you wish to scan. 1 IP perline, you can also add them to the hosts file with a name so you have a better idea what you are looking at.
 	Nmap scan report for Custom Name (X.X.X.X) vs Nmap scan report for (X.X.X.X)

 - You can also adjust the nmap args if these dont fit your needs.

 - There is an external.rb and external_test.rb. This will allow you to always have a working copy and allow you to test new settings.

 **DISCLAIMER**
These scripts are for use with your IPs or IPs you have premission to scan. I will not take responsibility if you use these scripts to scan IPs you do not have premission to scan or otherwise use them in a malicious way. 