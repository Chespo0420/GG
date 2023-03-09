Algoritmo sin_titulo
	Definir torres,cant_discos,discos,i Como Enteros;
    Dimension torres[3,10], cant_discos[3];
    
    // pedir y validar cuantos discos colocar en la primer torre
    Escribir "Ingrese el nro de discos (1-8):";
    leer discos;
    mientras discos<1 | discos>8 Hacer
        Escribir "El numero de discos debe ser mayor a 0 y menor a 5:";
        leer discos;
    finmientras
	
    // inicializar los datos
    cant_discos[0]<-discos;
    cant_discos[1]<-0;
    cant_discos[2]<-0;
    Para i<-0 Hasta discos-1 hacer
        torres[0,i]<-discos-i+1;
    FinPara
    
    
    // jugar!
    Definir j,t0,t1,t2,disco_a_mover,cant_movs Como Enteros;
    Definir puede_mover Como Logico;
    cant_movs<-0;
    Mientras cant_discos[2]<>discos Hacer // mientras no esten todos los discos en la tercer torre, el juego sigue
        
        Limpiar Pantalla;
        
        Para i<-0 Hasta 2 Hacer // dibujar las tres torres
            escribir "Torre ",i+1;
            si cant_discos[i]=0 Entonces
                Escribir "";
            sino
                para j<-cant_discos[i]-1 hasta 0 con paso -1 Hacer // recorrer los discos de la torre, de arriba hacia abajo
                    segun torres[i,j] Hacer // dibujar cada disco
                        1: Escribir "                   XX";
                        2: Escribir "                 XXXXXX";
                        3: Escribir "               XXXXXXXXXX";
                        4: Escribir "             XXXXXXXXXXXXXX";
                        5: Escribir "           XXXXXXXXXXXXXXXXXX";
                        6: Escribir "         XXXXXXXXXXXXXXXXXXXXXX";
                        7: Escribir "       XXXXXXXXXXXXXXXXXXXXXXXXXX";
                        8: Escribir "     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
                    finsegun
                FinPara
            finsi
            Escribir "   ----------------------------------";
            Escribir "";
        FinPara
        
        // solicitar movimiento
        Escribir "Mover desde la torre: ";
        leer t1;
        Escribir "hacia la torre: ";
        leer t2;
        
        si t1<1 | t1>3 | t2<1 | t2>3 Entonces // controlar que el nro de torre sea valido
            Escribir "Movimiento invalido";
            Esperar Tecla;
        sino
            Si cant_discos[t1-1]=0 Entonces // controlar que la torre 1 tengo al menos un disco
                Escribir "Movimiento invalido";
                Esperar Tecla;
            Sino
                disco_a_mover <- torres[t1-1,cant_discos[t1-1]-1]; // obtener tamanio del disco que se quiere mover
                puede_mover<-verdadero;
                Si cant_discos[t2-1]<>0 entonces // controlar que la torre dos no tenga discos o tenga solo discos mas grandes
                    Si torres[t2-1,cant_discos[t2-1]-1]<disco_a_mover Entonces
                        puede_mover<-Falso;
                    FinSi
                FinSi
                Si puede_mover Entonces // si paso todos los controles, mover
                    cant_movs <- cant_movs+1;
                    cant_discos[t2-1]<-cant_discos[t2-1]+1;
                    torres[t2-1,cant_discos[t2-1]-1] <- disco_a_mover;
                    cant_discos[t1-1]<-cant_discos[t1-1]-1;
                Sino
                    Escribir "Movimiento invalido";
                    Esperar Tecla;
                FinSi
            FinSi
        FinSi
		
    FinMientras
    
    // mostrar resultado
    Limpiar Pantalla;
    Escribir "Juego finalizado en ",cant_movs," movimientos!";
FinAlgoritmo
