package com.company.tools;

import org.germain.tool.ManaBox;

import java.util.HashMap;
import java.util.Map;

public class Transcoder {
    private Map<Character, String> encode =new HashMap<Character, String>();
    private Map<String, Character> decode =new HashMap<String, Character>();

    public Map<Character, String> getEncode() {
        return encode;
    }

    public Map<String, Character> getDecode() {
        return decode;
    }

    public Transcoder(String keyCrypted) {

        String key = ManaBox.decrypt(keyCrypted);
        String alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        char[]keyArray = key.toCharArray();

        //Boucles de génération de maps

        //Boucle pour encoder la clé cryptée

        for(int i = 0; i <= key.length(); i++){

            if(i >= 0 && i <= 25){
                String couple1 = alph.charAt(0) + alph.substring(i, i+1);
                encode.put(keyArray[i], couple1);
            }
            else if(i >= 26 && i <= 51 ){
                String alph2 = alph + alph;
                String couple2 = alph.charAt(1) + alph2.substring(i, i+1);
                encode.put(keyArray[i], couple2);
            }
            else if(i >= 52 && i < 58){
                String alph3 = alph + alph + alph;
                String couple3 = alph.charAt(2) + alph3.substring(i, i+1);
                encode.put(keyArray[i], couple3);
            }
        }

        //Boucle pour décoder le code en couple de lettres

        for(int i = 0; i <= key.length(); i++){

            if(i >= 0 && i <= 25){
                String couple1 = alph.charAt(0) + alph.substring(i, i+1);
                decode.put(couple1, keyArray[i]);
            }
            else if(i >= 26 && i <= 51 ){
                String alph2 = alph + alph;
                String couple2 = alph.charAt(1) + alph2.substring(i, i+1);
                decode.put(couple2, keyArray[i]);
            }
            else if(i >= 52 && i < 58){
                String alph3 = alph + alph + alph;
                String couple3 = alph.charAt(2) + alph3.substring(i, i+1);
                decode.put(couple3, keyArray[i]);
            }
        }
    }

    public String encode(String msg){
        // méthode qui prend une string codée et qui renvoie
        // une string décodée
        return msg;
    }

    public String decode(String msg){
        // méthode qui prend une string et qui renvoie
        // une string codée
        return msg;
    }
}
