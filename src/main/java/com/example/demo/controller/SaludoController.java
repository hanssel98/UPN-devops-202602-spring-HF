package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SaludoController {

    @GetMapping("/saludo")
    public String enviarSaludo() {
        return "¡Hola! Saludos desde la aplicación Spring Boot.";
    }
}