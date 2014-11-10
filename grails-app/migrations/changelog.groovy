databaseChangeLog = {
    (1..1).each {
        include file: "changelog-${it}.groovy"
    }
}