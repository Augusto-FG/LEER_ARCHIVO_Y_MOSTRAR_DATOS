# LEER_ARCHIVO_Y_MOSTRAR_DATOS
Un banco posee el siguiente archivo de operaciones, en el cual registra las operaciones de sus clientes sobre sus cuentas corrientes, cajas de ahorro y plazo fijo que ingresan por el canal de Home Banking.
El archivo de movimientos por Home Banking es un secuencial ordenado con el siguiente diseño:
MOV-HB Secuencial ordenado por Cod-Clie, Tipo-Cta, Sucursal, Cuenta, Digito, Fecha-Oper
	
Se debe realizar un programa estructurado que procese dicha información y genere un listado con el siguiente formato:
--------------------------------------------------------
Fecha:aaaa/mm/dd	 	 	 	 	Hoja nro 9	 	 	 
 		LISTADO DE MOVIMIENTOS POR HOME BANKING				 
CODIGO DE CLIENTE:  99999								 
TIPO DE CUENTA:  XXXX								 
Numero de cuenta		Fecha	Código de operación	Importe	 
9999-99999999-9		aaaa/mm/dd	xxxxx	+ZZZZZZZ9,99	 
-------------------------------------------------------
Aclaraciones: 
•	Los tipos de cuenta pueden ser:
o	PF Plazo fijo
o	CA Caja de Ahorro
o	CC cuenta corriente
•	El número de cuenta en el listado está conformado con sucursal-cuenta-digito
