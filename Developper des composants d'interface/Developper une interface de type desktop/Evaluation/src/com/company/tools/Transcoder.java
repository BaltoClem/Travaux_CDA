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
        
        String alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        char[]keyArray = key.toCharArray();
        //char[] lettre = alph.toCharArray();

        for(int i = 0; i <= key.length(); i++){

            if(i > 25 && i < 51 ){
                String couple1 = alph.charAt(1) + alph.substring(i, i+1);
                encode.put(keyArray[i], couple1);
            }
            else if(i > 51 ){
                String couple2 = alph.charAt(2) + alph.substring(i, i+1);
                encode.put(keyArray[i], couple2);
            }
            else{
                String couple3 = alph.charAt(0) + alph.substring(i, i+1);
                encode.put(keyArray[i], couple3);
            }
        }
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
