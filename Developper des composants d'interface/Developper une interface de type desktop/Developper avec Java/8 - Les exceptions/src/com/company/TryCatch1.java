package com.company;

public class TryCatch1
{
    public static void main( String[] args )
    {
        int nX = 6;
        int nY = 3;
        try
        {
            System.out.print( nX + " / " + nY + " = ");
            System.out.println(nX/nY);
        }
        catch (ArithmeticException e)
        {
            System.out.println("Erreur!");
            System.out.println("Exception ArithmeticException interceptee ");
            System.out.println(e);
            System.out.println("Ouf,le programme n'est pas plante...");
        }
    }
}