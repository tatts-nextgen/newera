databaseChangeLog = {
    (1..2).each {
        include file: "changelog-${it}.groovy"
    }
}