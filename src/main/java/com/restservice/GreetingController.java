package com.restservice;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

    @GetMapping("/ping")
    public ResponseEntity pong() {
        return ResponseEntity.ok("Pong");
    }
}
