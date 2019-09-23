# Get County Data from Tableau Dashboard

Dashboard: https://public.tableau.com/profile/drap4687#!/vizhome/MassachusettsTrialCourtChargesDashboard/Dashboard

In Firefox look at  Web Developer > Network, press ctrl+f5 to refresh the tableau, then look for a POST request that looks like (it has a large size):

DBB269AE1A4E4A3EA278CB7B88FA5E2B-0:0

Right click the request, select open in new tab to download the file, which can be put into the script county_script.rb

Change the path the POST request response file located at ./responses/FILE_NAME

Any changes made on the dashboard (changing the year, changing which offense is selected) will also change the results of downloading the request, even though it does not generate a new POST. Firefox extensions can intercept and create HTTP requests, so I imagine an automatic scraper might be possible using a firefox extension to save the data, and an autohotkey script to click the offenses and trigger the extension one after another.

# Get Totals from All Offenses

2018-municipal.rb and 2019-municipal.rb creates json and csv data of all municipal offenses, but does not break it down by county.
