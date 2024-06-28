package org.choongang.member.controllers;

import lombok.Data;

@Data
public class RequestProfile {
    private String password;
    private String confirmPassword;
    private String userName;
}
