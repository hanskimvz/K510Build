/* Copyright (c) 2022, Hans Kim

*/

#include <stdio.h>
#include <sqlite3.h>
#include "params.h"


int parse_params(void *data, int argc, char **argv, char **azColName){
    // for (int i=0; i<argc; i++) {
    //     printf("%s = %s,", azColName[i], argv[i] ? argv[i] : "NULL");
    // }
    printf ("%s=%s, ", azColName[0], argv[0]);
    printf ("%s=%s, ", azColName[1], argv[1]);
    printf ("%s=%s\n", azColName[2], argv[2]);

    
    return 0;
}

int read_db_setting(){
    sqlite3 *db;
    char *zErrMsg = 0;
    int rc;
    const char *sql = "select groupPath, entryName, entryValue from param_tbl where group1='encoder'";

    /* Open database */
    rc = sqlite3_open(PARAM_DB_NAME, &db);

    if( rc != SQLITE_OK) {
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        return(0);
    }
    /* Execute SQL statement */
    // rc = sqlite3_exec(db, sql, parse_params, (void*)data, &zErrMsg);
    rc = sqlite3_exec(db, sql, parse_params, 0, &zErrMsg);

    if( rc != SQLITE_OK ) {
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }
    sqlite3_close(db);
    return 0;
}


int main(void)
{
    read_db_setting();
    
}
