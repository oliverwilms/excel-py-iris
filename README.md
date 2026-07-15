# excel-py-iris

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/oliverwilms/excel-py-iris.git
```

Open the terminal in this directory and run:

```
$ docker-compose up -d
```

## Run python code to read an excel file and populate IRIS global

```
$ docker-compose exec -it iris python3 /usr/irissys/mgr/python/iter_excel.py /opt/irisapp/excel/excel_python_iris.xlsx
```

## Run Python script from Interoperability BPL / Testing Productions

```
USER>d ##class(otw.iris.testproduction).Run()
```

## Import NEW workbook IRIS global into legacy excel global

```
USER>d ##class(otw.iris.workbook).importWorkbook()
1
```

## Import Excel data from IRIS global into IRIS persistent class

```
USER>w ##class(otw.iris.excel).importExcel(-1)
1
```

I added -1 above because I want to start importing with sheet 0. In my personal Excel workbook, I want to skip the first five workbooks.

## See data from Excel workbook in IRIS SQL table

![screenshot](https://github.com/oliverwilms/bilder/blob/main/Capture_SQL.JPG)

## Utilize iris-globals-contest for counting Transactions

```
USER>do ##class(dc.iris.count).Count()
11592 Transactions counted.
```

## Export global

```
USER>do $System.OBJ.Export("wbook.GBL","/opt/irisapp/global_workbook.xml",,.errors)

Exporting to XML started on 07/12/2026 23:01:23
Exporting global: ^wbook
Export finished successfully.
```
