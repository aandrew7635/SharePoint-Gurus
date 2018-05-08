######################################################################
#   Creates a new content database and site collection               #
#   Author: Aaron Andrews                                            #
#   Date:   05-08-2018                                               #
#   Permissions Required - securityadmin, db_owner, local admin      #
######################################################################

#variables
$dbserver = Read-Host "SQL Server"
$dbname = Read-Host "Content Database Name"
$webapp = Read-Host "Web Application"
$siteurl = Read-Host "Site URL"
$sitename = Read-Host "Site Title"
$owner = Read-Host "Site Collection Owner (ndc\username)"
$template = Read-Host "Site Template (Team Site = STS#0)"
$quotatemplate = Read-Host "Quota Template (Default = IRD SharePoint Service Quota)"

#Create the content database
New-SPContentDatabase -Name $dbname -DatabaseServer $dbserver -WebApplication $webapp

#Create the site collection
New-SPSite -URL $siteurl -HostHeaderWebApplication $webapp -Name $sitename -OwnerAlias $owner -ContentDatabase $dbname -Template $template -QuotaTemplate $quotatemplate