package com.company.tools;
import org.germain.tool.ManaBox;

import java.util.Map;

public class Transcoder {
    private Map<Character,String> encode;
    private Map<String,Character> decode;

    public Map<Character, String> getEncode() {
        return encode;
    }

    public Map<String, Character> getDecode() {
        return decode;
    }

    public Transcoder(String keyCrypted) {
        String key = ManaBox.decrypt(keyCrypted);

        //boucles de génération de maps
    }

    public String encode(String message){
        //décodage
        return message;
    }
}
