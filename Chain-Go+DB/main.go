package main

import (
  "database/sql"
  "fmt"

  _ "github.com/lib/pq" //pq: A pure Go postgres driver for Go's database/sql package
)

const (
  host     = "localhost"
  port     = 5432
  user     = "postgres"
  password = "none"
  dbname   = "lichunmiao"
)

type D3_Doctor struct {
  patientID        int
  medicationName       string
  clinicalData string
  mechanismOfAction  string
  dosage     string
}

func main() {
  psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
    "password=%s dbname=%s sslmode=disable",
    host, port, user, password, dbname)
  db, err := sql.Open("postgres", psqlInfo)
  if err != nil {
    panic(err)
  }
  defer db.Close()

  // =========QUERY a record from table d3_doctor========
  sqlStatement := `SELECT * FROM d3_doctor WHERE patientId=$1;`
  var doctor D3_Doctor
  row := db.QueryRow(sqlStatement, 188) //QueryRow() method to query for a single row.
  switch err := row.Scan(&doctor.patientID, &doctor.medicationName, &doctor.clinicalData, &doctor.mechanismOfAction, &doctor.dosage);
  err {
  case sql.ErrNoRows:
    fmt.Println("No rows were returned!")
    return
  case nil:
    fmt.Println(doctor)
  default:
    panic(err)
  }

  // =========INSERT a record to table d3_doctor========
  // sqlStatement := `
  // INSERT INTO D3_Doctor (patientID, medicationName, clinicalData, mechanismOfAction, dosage)
  // VALUES ($1, $2, $3, $4, $5)
  // RETURNING patientID`
  //   patientID := 200
  // 	err = db.QueryRow(sqlStatement, 200, "try", "try", "try", "try").Scan(&patientID)
  //   if err != nil {
  //     panic(err)
  //   }
  //   fmt.Println("New record ID is:", patientID)

  // =========UPDATE a record on table d3_doctor========
  // sqlStatement := `
  // UPDATE D3_Doctor
  // SET medicationName = $2
  // WHERE patientID = $1;`
  // _, err = db.Exec(sqlStatement, 200, "llala9")
  // if err != nil {
  //   panic(err)
  // }

  // =========DELETE a record from table d3_doctor========
  // sqlStatement := `
  // DELETE FROM D3_Doctor
  // WHERE patientID = $1;`
  // _, err = db.Exec(sqlStatement, 200)
  // if err != nil {
  //   panic(err)
  // }



}
