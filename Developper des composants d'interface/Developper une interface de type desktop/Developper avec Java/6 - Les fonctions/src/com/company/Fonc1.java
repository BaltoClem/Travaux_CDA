package com.company;


public class Fonc1
{

    public static void main (String[] args)
    {
        int nombre = 12 ;
        System.out.println(nombre) ;
        calculeCarre(nombre) ;
        System.out.println(nombre) ;
    }

    public static void calculeCarre(int n)
    {
        n = n * n ;
        System.out.println(n) ;
    }

}
