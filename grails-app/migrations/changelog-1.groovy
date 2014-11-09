databaseChangeLog = {

	changeSet(author: "jgaines (generated)", id: "1415442853704-1") {
		createTable(tableName: "registration") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "registrationPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "phone", type: "varchar(255)")
		}
	}

	changeSet(author: "jgaines (generated)", id: "1415442853704-2") {
		createIndex(indexName: "email_idx", tableName: "registration") {
			column(name: "email")
		}
	}
}
