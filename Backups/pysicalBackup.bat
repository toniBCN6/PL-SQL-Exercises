@echo off
set user=sys
set pass=sys
set db=xepdb1
set dba=as sysdba

echo Pulse cualquier tecla para detener la base de datos..
pause>nul
sqlplus "%user%"/"%pass%"@"%db%" "%dba%" @stopdb.sql>nul
echo Pulse cualquier boton para copiar los ficheros (ficheros de datos,redo log y control)
pause>nul
echo Copiando ficheros porfavor espere..
copy "E:\18.0.0\oradata\XE\*" "E:\BackupOracle\Physical\oradata">nul
copy "E:\18.0.0\dbhomeXE\database\*" "E:\BackupOracle\Physical\database">nul
echo Pulse una tecla para ver la comprobacion.
pause>nul
dir "E:\BackupOracle\Physical"
echo Pulse cualquier tecla para iniciar la base de datos..
pause>nul
sqlplus "%user%"/"%pass%"@"%db%" "%dba%" @startdb.sql>nul
echo Pulse cualquier boton para salir
pause>nul
