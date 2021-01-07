package com.company.model;

import com.company.tools.Transcoder;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

public class Message {
    private Transcoder transCoder;
    private Boolean encoded;
    private List<String> msgClear;
    private List<String> msgEncoded;
    private Path msgClearPath;
    private Path msgEncodedPath;
    private Path keyPath;
    private String key;


    /**
     * Constructeur de l'objet message
     * @param encoded booléen pour savoir si le message est encodé ou non
     * @param msgClearPath chemin vers le fichier décodé
     * @param msgEncodedPath chemin vers le fichier codé
     * @param keyPath chemin vers la clé
     * @throws IOException
     */
    public Message(Boolean encoded, Path msgClearPath, Path msgEncodedPath, Path keyPath) throws IOException {
        this.encoded = encoded;
        this.msgClearPath = msgClearPath;
        this.msgEncodedPath = msgEncodedPath;
        this.keyPath = keyPath;
        this.key = Files.readString(keyPath);

        this.transCoder = new Transcoder(key);
    }

    public void readNwrite() {

    }

}
