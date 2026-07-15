ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE

WORKDIR /opt/irisapp

USER root
RUN apt update && apt-get -y install git
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp

USER ${ISC_PACKAGE_MGRUSER}
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} excel excel
COPY iris.script iris.script
COPY module.xml module.xml
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} python python
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} python /usr/irissys/mgr/python
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} src src
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} yaml yaml
RUN mkdir -p inbox archive tests
RUN pip install iris-embedded-python-wrapper --upgrade --break-system-packages
RUN iris start IRIS && iris session IRIS < iris.script && iris stop IRIS quietly
