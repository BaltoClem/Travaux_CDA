package com.company.model;

import com.company.tools.Transcoder;

import java.nio.file.Path;
import java.util.List;

public class Message {
    private Boolean encoded;
    private List<String> msgClear;
    private List<String> msgEncoded;
    private Path msgClearPath;
    private Path msgEncodedPath;
    private Path keyPath;
    private String key;
    private Transcoder Transcoder;
}
