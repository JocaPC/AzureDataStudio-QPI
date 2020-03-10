# Azure Data Studio - Query Performance Insights

Query Performance Insights is Azure Data Studio extension that enables you to monitor performance and troubleshoot performance using [Query Performance Insights](https://github.com/JocaPC/qpi) T-SQL library. 

[Query Performance Insights  library](https://github.com/JocaPC/qpi) is a collection of useful scripts that enable you find what is happening with your SQL Server 2016+ or Azure SQL Database (Single or Managed Instance). This is a set of helper views, functions, and procedures that wrap Query Store and Dynamic Management Objects.

Query Performance Insights Azure Data Studio extension is a user interface that enables you to easily install [Query Performance Insights  library](https://github.com/JocaPC/qpi) in your database and see the most usefull reports without need to write SQL queries.

## Instalation

Find **Query Performance Insights** extension in Azure Data studio and install the lates available version. 

## Install QPI scripts in your database

Database that you analyze must have [Query Performance Insights scripts](https://github.com/JocaPC/qpi) addes to your database.

If you are using Azure SQL Managed Instance or SQL server 2019+, you can install the [Query Performance Insights scripts](https://github.com/JocaPC/qpi) directly using the extension. 
Find the database that you want to analyze in connections and use **QPI: Install latest QPI scripts** option. Run the query that is opened to add QPI objects.

If you are using Azure SQL Database or SQL Server 2016-2017, find the version of the script in [QPI installation](https://github.com/JocaPC/qpi#installation) section.

![Install QPI](https://raw.githubusercontent.com/JocaPC/AzureDataStudio-QPI/master/images/ads-qpi-install.gif)

After installation, you will get the schema `qpi` in your database will the set of views, functions, and tables needed for performance troubleshooting. If you want to remove your QPI script from the database, right-click and use **QPI: Remove  QPI scripts** option.

## Troubleshot and analyze database performance

Select your database and open `QPI` tab. Here you can see a set of reports divided in the following sections:
- Properties
- File IO
- Memory
- Query statistics

If you see anything strange in the reports select right-upper corner of the report and select **Run Query** option. This option will open the underlying query used for report that you can modify.

![Troubeshoot using QPI](https://raw.githubusercontent.com/JocaPC/AzureDataStudio-QPI/master/images/ads-qpi-troubleshoot.gif)

There is a set of predefined snippets with `qpi:` prefix that will be expanded as usefull queries that you can use for analysis.

## Snapshots

Some metrics in database are cumulative and you need to take periodic snapshots of these metrics to have baseline for reports. The following metrics need baselines:
- File statistics
- Wait statistics
- Performance counters

You can open new query and use `qpi:snapshot` snippet to take a snapshot of all statistics mentioned above. You can also use `qpi:snapshot file stats   , `qpi:snapshot wait stats`, and `qpi:snapshot perf counters` to take the snapshot of specific statistic.

You can also create SQL Agent job that will periodically take snapshots of statistics. Right-click on the instance and select **QPI: Install SQL Agent job that will periodically take the snapshots of statistics**. In the query window set the name of database where statistic snapshots should be taken. 
