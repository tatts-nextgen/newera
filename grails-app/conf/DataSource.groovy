dataSource {
    dbCreate        = 'none'
    dialect         = org.hibernate.dialect.MySQL5InnoDBDialect
    driverClassName = 'com.mysql.jdbc.Driver'
    pooled          = true
    url             = 'jdbc:mysql://localhost/newera'
    username        = 'newera'
    password        = 'newera'
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache        = false
    cache.region.factory_class   = 'org.hibernate.cache.ehcache.EhCacheRegionFactory'
}

environments {
    test {
        dataSource {
            dbCreate        = 'update'
            dialect         = org.hibernate.dialect.H2Dialect
            driverClassName = 'org.h2.Driver'
            url             = 'jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000'
            username        = 'sa'
            password        = ''
        }
    }

    production {
        dataSource {
            // Elastic Beanstalk uses these environment variables to pass RDS connection details
            final p = System.properties
            if (p.RDS_DB_NAME) {
                url = "jdbc:mysql://${p.RDS_HOSTNAME}:${p.RDS_PORT}/${p.RDS_DB_NAME}"
                username = p.RDS_USERNAME
                password = p.RDS_PASSWORD
            }
            properties {
                jmxEnabled = true
                initialSize = 5
                maxActive = 50
                minIdle = 5
                maxIdle = 25
                maxWait = 10000
                maxAge = 10 * 60000
                timeBetweenEvictionRunsMillis = 5000
                minEvictableIdleTimeMillis = 60000
                validationQuery = "SELECT 1"
                validationQueryTimeout = 3
                validationInterval = 15000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                jdbcInterceptors = "ConnectionState"
                defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
                dbProperties {
                    autoReconnect = false
                    jdbcCompliantTruncation = false
                    zeroDateTimeBehavior = 'convertToNull'
                    cachePrepStmts = false
                    cacheCallableStmts = false
                    dontTrackOpenResources = true
                    holdResultsOpenOverStatementClose = true
                    useServerPrepStmts = false
                    cacheServerConfiguration = true
                    cacheResultSetMetadata = true
                    metadataCacheSize = 100
                    connectTimeout = 15000
                    socketTimeout = 120000
                    maintainTimeStats = false
                    enableQueryTimeouts = false
                    noDatetimeStringSync = true
                }
            }
        }
    }
}
