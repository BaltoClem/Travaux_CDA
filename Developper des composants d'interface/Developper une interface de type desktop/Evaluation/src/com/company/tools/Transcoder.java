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

        //Boucles de génération de maps

        //Boucle pour encoder la clé cryptée

        String alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        char[]keyArray = key.toCharArray();

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
        //Boucle pour décoder le code en couple de lettres et obtenir une phrase finale



    }

    public String encode(String msg){
        // encode
        return msg;
    }

    public String decode(String msg){
        // décode
        return msg;
    }
}
