package com.restservice;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class GreetingController {

    @GetMapping("/ping")
    public ResponseEntity pong() {
        return ResponseEntity.ok("Pong");
    }

    @GetMapping("/me")
    public ResponseEntity me() {
        return ResponseEntity.ok("It is me!");
    }
}