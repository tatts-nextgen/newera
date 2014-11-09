grails.servlet.version = '3.0' // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = 'target/classes'
grails.project.test.class.dir = 'target/test-classes'
grails.project.test.reports.dir = 'target/test-reports'
grails.project.work.dir = 'target/work'
grails.project.target.level = 1.7
grails.project.source.level = 1.7

grails.project.dependency.resolver = 'maven'
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits('global') {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log 'error' // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        mavenLocal()
        grailsCentral()
        mavenCentral()
        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo 'http://repository.codehaus.org'
        //mavenRepo 'http://download.java.net/maven/2/'
        //mavenRepo 'http://repository.jboss.com/maven2/'
    }

    dependencies {
        compile 'joda-time:joda-time:2.5'

        runtime 'mysql:mysql-connector-java:5.1.33'

        test    'org.grails:grails-datastore-test-support:1.0.2-grails-2.4'
    }

    plugins {
        // plugins for the build system only
        build ':tomcat:7.0.55'

        // plugins for the compile step
        compile ':scaffolding:2.1.2',
                ':cache:1.1.8',
                ':asset-pipeline:1.9.9',
                ':twitter-bootstrap:3.3.0',
                ':excel-export:0.2.1',
                ':spring-security-core:2.0-RC4'

        // plugins needed at runtime but not for compilation
        runtime ':hibernate4:4.3.6.1',
                ':database-migration:1.4.0',
                ':jquery:1.11.1',
                ':font-awesome-resources:4.2.0.0'

        // Uncomment these to enable additional asset-pipeline capabilities
        //compile ':sass-asset-pipeline:1.9.0'
        //compile ':less-asset-pipeline:1.10.0'
        //compile ':coffee-asset-pipeline:1.8.0'
        //compile ':handlebars-asset-pipeline:1.3.0.3'
    }
}
