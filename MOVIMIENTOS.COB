       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOVIMIENTOS.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
       SELECT OPTIONAL MOVIMIENTOS-ARCHIVO
       ASSIGN TO "C:\Users\Augusto\Desktop\movimientos.dat"
       ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD MOVIMIENTOS-ARCHIVO.
       01 MOVIMIENTOS-REGISTRO.
           05 CLIENTE PIC X(11).
           05 T-CTA PIC X(10).
           05 SUCURSAL PIC X(8).
           05 CUENTA PIC X(16).
           05 DIGITO PIC X(5).
           05 FECHA PIC X(13).
           05 OPERACION PIC X(9).
           05 IMPORTE PIC X(15).
           05 CANAL PIC X(2).

       WORKING-STORAGE SECTION.

      *MARGEN SUPERIOR DEL ENCABEZADO

        01 LINEA1.
           05 FECHA1 PIC x(38) VALUE "Fecha:".
           05 ESPACIO PIC X(38) VALUE "-".
           05 HOJA PIC X(30) VALUE 'Hoja nro 9'.

        01 LINEA3.
           05 SUBLINEA3-1 PIC X(20) VALUE "-".
           05 SUBLINEA3-2-4 PIC X(11) VALUE "LISTADO DE".
           05 SUBLINEA3-3-4 PIC X(16) VALUE "MOVIMIENTOS POR".
           05 SUBLINEA3-4-4 PIC X(15) VALUE "HOMEBANCKING".

        01 LINEA4.
           05 NDECUENTA PIC x(18) VALUE "Numero de cuenta".
           05 FECHA3 PIC X(12) VALUE 'Fecha'.
           05 CODIGO2 PIC X(24) VALUE 'Codigo de operacion'.
           05 IMPORTE2 PIC X(20) VALUE 'Importe'.


       01  PRESENTACION.

           05 MUESTRA-SUCURSAL PIC X(5).
           05 MUESTRA-CUENTA PIC X(9).
           05 MUESTRA-DIGITO PIC X(4).
           05 MUESTRA-FECHA PIC X(18).
           05 MUESTRA-OPERACION PIC X(18).
           05 MUESTRA-IMPORTE PIC X(15).

           01  FIN-DEL-ARCHIVO PIC X.
           01  MAXIMO-REGISTROS PIC 99.
           01  GUARDA-ENTER PIC X.

      ******************************************************************
           PROCEDURE DIVISION.

           EMPIEZA-PROGRAMA.
           PERFORM APERTURA-ARCHIVO.
           MOVE ZEROES TO MAXIMO-REGISTROS.
           MOVE "1" TO FIN-DEL-ARCHIVO.
           PERFORM LEE-SIGUIENTE-REGISTRO.
      *    PRIMER ENCABEZADO
           DISPLAY LINEA1.
           DISPLAY LINEA3.
           DISPLAY "CODIGO DE CLIENTE:" CLIENTE.
           DISPLAY "TIPO DE CUENTA:" T-CTA.
           DISPLAY " "
           DISPLAY LINEA4.

           PERFORM MUESTRA-REGISTROS

           UNTIL FIN-DEL-ARCHIVO = "0".
           PERFORM CIERRE-ARCHIVO.
           PROGRAM-DONE.
           STOP RUN.

      ******************************************************************
           APERTURA-ARCHIVO.
           OPEN INPUT MOVIMIENTOS-ARCHIVO.

      ******************************************************************
           CIERRE-ARCHIVO.
           CLOSE MOVIMIENTOS-ARCHIVO.
      ******************************************************************


           MOSTRAR_ENCABEZADO.
              DISPLAY LINEA1.
              DISPLAY LINEA3.
              DISPLAY "CODIGO DE CLIENTE:" CLIENTE.
              DISPLAY "TIPO DE CUENTA:" T-CTA.
              DISPLAY " "
              DISPLAY LINEA4.

      *******************************************************************
           MUESTRA-REGISTROS.

               IF MAXIMO-REGISTROS = 7
      *MOSTRAMOS EL ENCABEZADO EN TODOS LOS CLIENTES COMO INDICA LA PRÁCTICA
                   PERFORM MOSTRAR_ENCABEZADO
                   MOVE 0 TO MAXIMO-REGISTROS.

           PERFORM MUESTRA-CAMPOS.
           PERFORM LEE-SIGUIENTE-REGISTRO.

      ******************************************************************
               MUESTRA-CAMPOS.

                   IF MAXIMO-REGISTROS = 7
                   PERFORM PULSAR-ENTER.

           MOVE SUCURSAL TO MUESTRA-SUCURSAL.
           MOVE CUENTA TO MUESTRA-CUENTA.
           MOVE DIGITO TO MUESTRA-DIGITO.
           MOVE FECHA TO MUESTRA-FECHA.
           MOVE OPERACION TO MUESTRA-OPERACION.
           MOVE IMPORTE TO MUESTRA-IMPORTE.



           DISPLAY PRESENTACION.
           ADD 1 TO MAXIMO-REGISTROS.

      ******************************************************************
               LEE-SIGUIENTE-REGISTRO.
           READ MOVIMIENTOS-ARCHIVO NEXT RECORD
           AT END
           MOVE "0" TO FIN-DEL-ARCHIVO.

           PULSAR-ENTER.
           DISPLAY
           "Presione la tecla ENTER para ver el siguiente hoja...".
           ACCEPT GUARDA-ENTER.
           MOVE ZEROES TO MAXIMO-REGISTROS.
