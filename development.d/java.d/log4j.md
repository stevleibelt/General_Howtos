# Jog4J

## Log to xml file

* Keyword is `XMLLayout`

### As XML configuration file

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN">
    <Appenders>
        <RollingFile name="XMLRollingfileAppender"
            fileName="target/appXmlLog.xml"
            filePattern="target/appXmlLog-%d{yyyy-MM-dd}-%i.xml.gz"
        >
            <XMLLayout />
            <Policies>
                <SizeBasedTriggeringPolicy size="7MB" />
            </Policies>
        </RollingFile>
    </Appenders>
    <Loggers>
        <Root level="DEBUG">
            <AppenderRef ref="XMLRollingfileAppender" />
        </Root>
    </Loggers>
</Configuration>
```

### As properties configuration file

``` bash
property.basePath = /var/log/my_application/

appender.rolling.type = RollingFile
appender.rolling.name = fileLogger
appender.rolling.fileName= ${basePath}/appXmlLog.log
appender.rolling.filePattern= ${basePath}/appXmlLog_%d{yyyyMMdd}.xml.gz
appender.rolling.layout.type = XMLLayout
appender.rolling.policies.type = Policies
appender.rolling.policies.size.type = SizeBasedTriggeringPolicy
appender.rolling.policies.size.size = 7MB

rootLogger.level = debug
rootLogger.appenderRef.rolling.ref = fileLogger
```

## Links

* [Log4j2 XMLLayout - howtodoinjava.com](https://howtodoinjava.com/log4j2/xml-layout/) - 20220704T13:08:20
* [Log4J2 XMLLayout - logging.apache.org](https://logging.apache.org/log4j/log4j-2.5/manual/layouts.html#XMLLayout) - 20220704T13:14:50

