function! JavaBuffer ()
    let f=expand('%')
    let pd = GetPackageDirectory(f)
    let cp = 'target/classes:
\/Users/tlovell/.m2/repository/com/jidesoft/jide-oss/3.6.12/jide-oss-3.6.12.jar:
\/Users/tlovell/.m2/repository/com/idexx/libs/core/SwingCore/1.1.21/SwingCore-1.1.21.jar:
\/Users/tlovell/.m2/repository/log4j/log4j/1.2.16/log4j-1.2.16.jar:
\/Users/tlovell/.m2/repository/com/inet/jortho/0.4/jortho-0.4.jar:
\/Users/tlovell/.m2/repository/org/swinglabs/swingx/1.6/swingx-1.6.jar:
\/Users/tlovell/.m2/repository/com/jidesoft/jide-jdaf/2.3.0/jide-jdaf-2.3.0.jar:
\/Users/tlovell/.m2/repository/com/jidesoft/jlfgr/1.0/jlfgr-1.0.jar:
\/Users/tlovell/.m2/repository/commons-lang/commons-lang/2.3/commons-lang-2.3.jar:
\/Users/tlovell/.m2/repository/com/jidesoft/jide/jide-grids/2.8.7/jide-grids-2.8.7.jar:
\/Users/tlovell/.m2/repository/com/jidesoft/jide/jide-common/2.8.7/jide-common-2.8.7.jar:
\/Users/tlovell/.m2/repository/jgoodies/forms/1.0.4/forms-1.0.4.jar:
\/Users/tlovell/.m2/repository/org/swinglabs/jxlayer/3.0.3/jxlayer-3.0.3.jar:
\/Users/tlovell/.m2/repository/com/idexx/libs/core/I18NCore/1.0.12/I18NCore-1.0.12.jar:
\/Users/tlovell/Documents/workspaces/LYNXX/LYNXXTransfersMicroServicesAPI/target/classes:
\/Users/tlovell/Documents/workspaces/LYNXX/LYNXXTransfersLibraries/target/classes:
\/Users/tlovell/.m2/repository/com/sun/jersey/jersey-bundle/1.17.1/jersey-bundle-1.17.1.jar:
\/Users/tlovell/.m2/repository/com/sun/jersey/jersey-core/1.17.1/jersey-core-1.17.1.jar:
\/Users/tlovell/.m2/repository/org/codehaus/jackson/jackson-core-asl/1.9.2/jackson-core-asl-1.9.2.jar:
\/Users/tlovell/.m2/repository/org/codehaus/jackson/jackson-mapper-asl/1.9.2/jackson-mapper-asl-1.9.2.jar:
\/Users/tlovell/.m2/repository/org/codehaus/jackson/jackson-jaxrs/1.9.2/jackson-jaxrs-1.9.2.jar:
\/Users/tlovell/.m2/repository/org/codehaus/jackson/jackson-xc/1.9.2/jackson-xc-1.9.2.jar:
\/Users/tlovell/.m2/repository/com/sun/jersey/jersey-multipart/1.17.1/jersey-multipart-1.17.1.jar:
\/Users/tlovell/.m2/repository/org/eclipse/persistence/javax.persistence/2.1.1/javax.persistence-2.1.1.jar:
\/Users/tlovell/.m2/repository/log4j/log4j/1.2.16/log4j-1.2.16.jar:
\/Users/tlovell/.m2/repository/com/oracle/ojdbc6/11.1.0.7.0/ojdbc6-11.1.0.7.0.jar:
\/Users/tlovell/.m2/repository/org/eclipse/persistence/eclipselink/2.3.1/eclipselink-2.3.1.jar:
\/Users/tlovell/.m2/repository/javax/xml/ws/jaxws-api/2.2.8/jaxws-api-2.2.8.jar:
\/Users/tlovell/.m2/repository/javax/xml/bind/jaxb-api/2.2.4/jaxb-api-2.2.4.jar:
\/Users/tlovell/.m2/repository/javax/xml/stream/stax-api/1.0-2/stax-api-1.0-2.jar:
\/Users/tlovell/.m2/repository/javax/activation/activation/1.1/activation-1.1.jar:
\/Users/tlovell/.m2/repository/javax/xml/soap/saaj-api/1.3.4/saaj-api-1.3.4.jar:
\/Users/tlovell/.m2/repository/org/glassfish/javax.annotation/3.1.1/javax.annotation-3.1.1.jar:
\/Users/tlovell/.m2/repository/javax/jws/jsr181-api/1.0-MR1/jsr181-api-1.0-MR1.jar:
\/Users/tlovell/.m2/repository/javax/mail/mail/1.4/mail-1.4.jar:
\/Users/tlovell/.m2/repository/javax/javaee-web-api/6.0/javaee-web-api-6.0.jar:
\/Users/tlovell/.m2/repository/junit/junit/4.8.1/junit-4.8.1.jar'
    exec('!rm target/classes/'.pd)
    exec('!javac -cp '.cp.' -d target/classes '.f)
    exec('!java -cp '.cp. ' '.pd)
endfunction
